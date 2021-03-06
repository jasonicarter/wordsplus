#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <string>
#include <QList>
#include <QMap>
#include <QString>
#ifdef WIN32
#include <windows.h>
#else
#include <unistd.h>
#endif


//#define HARDNESS    8   /* The first direction we *WON'T* use */
#define GRID_SIZE  10   /* The size of the grid. */
#define WORD_COUNT 12

#define TRUE  1
#define FALSE 0

char *words[1000];
//char *puzzleWords[1000];
QList<char*> puzzleWords;
int next_word = 0;
int hardness = 8;
QMap<QString, int> wordIndex;

/* Directions are coded easiest to hardest. */

#define EAST       0
#define SOUTH      1
#define SOUTH_EAST 2
#define NORTH_EAST 3
#define NORTH      4
#define NORTH_WEST 5
#define SOUTH_WEST 6
#define WEST       7

int ns_lut[8] = { 0, 1, 1, -1, -1, -1, 1, 0 };
int ew_lut[8] = { 1, 0, 1, 1, 0, -1, -1, -1 };

class Grid {
	int max;
	char **letter;

public:

	void init() {
		letter = new char *[max];

		for (int i = 0; i < max; i++) {
			letter[i] = new char[max + 1];

			for (int j = 0; j < max; j++)
				letter[i][j] = ' ';

			letter[i][max] = '\0';
		}
	}

	Grid(int max_grid = 0) {
		if (max_grid <= 0)
			max = 20;
		else
			max = max_grid;

		init();
	}

	Grid(Grid *g) {
		max = g->get_max();
		init();

		for (int i = 0; i < max; i++)
			memcpy(letter[i], g->get_row(i), max + 1);
	}

	~Grid() {
		for (int i = 0; i < max; i++)
			delete letter[i];
		delete letter;
	}

	int get_max() {
		return max;
	}
	char *get_row(int i) {
		return letter[i];
	}

	int fit(char *s);
	int fits(int l, char *s, int i, int j, int dirn);
	void stuff(int l, char *s, int i, int j, int dirn);
	void garbage();

	void display() {
		printf("    ============================================\n");
		printf("\n");

		for (int i = 0; i < max; i++) {
			printf("         ");

			for (int k = 0; k < max; k++)
				printf(" %c", letter[i][k]);

			printf("\n");
		}
		printf("\n");
	}

	char** returnLetterGrid() {
		return letter;
	}
};

void Grid::garbage() {
	for (int i = 0; i < max; i++)
		for (int j = 0; j < max; j++)
			if (letter[i][j] == ' ') {
				int x = rand() % max;
				int y = rand() % max;

				if (letter[x][y] != ' ')
					letter[i][j] = letter[x][y];
				else if (letter[y][x] != ' ')
					letter[i][j] = letter[y][x];
				else
					letter[i][j] = rand() % 26 + 'A';
			}
}

int Grid::fit(char *s) {
	int ii, jj, dd;
	int i, j, d;

	int score = -1;
	int l = strlen(s);
	int good_fits = 0;

	/* Try ten random places first. */

	for (int r = 0; r < 10; r++) {
		i = rand() % max;
		j = rand() % max;
		d = rand() % hardness;

		int sc = fits(l, s, i, j, d);

		if (sc > score) {
			ii = i;
			jj = j;
			dd = d;
			score = sc;
			good_fits++;
		}
	}

	/*
	 Now begin a methodical search - but start it at a random
	 place so they don't all pack consecutively into the grid
	 */

	int xi, xj, xd;

	for (xi = 0, i = rand() % max; xi < max; xi++, i = (i + 1) % max)
		for (xj = 0, j = rand() % max; xj < max; xj++, j = (j + 1) % max) {
			if (letter[i][j] == ' ' || letter[i][j] == s[0])
				for (xd = 0, d = rand() % hardness; xd < hardness;
						xd++, d = (d + 1) % hardness) {
					int sc = fits(l, s, i, j, d);

					if (sc > score) {
						ii = i;
						jj = j;
						dd = d;
						score = sc;
						good_fits++;
					}

					/*
					 Finish if we find the *perfect* place - or if
					 we only found a ton of mediocre places.
					 */

					if (score >= l || (score > 0 && good_fits > 100 / score)
							|| good_fits > 1000) {
						stuff(l, s, ii, jj, dd);
						return TRUE;
					}
				}
		}

	if (score >= 0)
		stuff(l, s, ii, jj, dd);

	return score >= 0;
}

void Grid::stuff(int l, char *s, int i, int j, int dirn) {
	/* Stuff the word in here.  */

	int dx = ew_lut[dirn];
	int dy = ns_lut[dirn];

	int position;
	// Get array position
	if (i == 0) { position = j; }
	if (i > 0) { position = i * 10 + j; }
	wordIndex[QString(s)] = position;

	for (int k = 0; k < l; k++) {
		letter[i][j] = s[k];
		i += dy;
		j += dx;
	}
}

int Grid::fits(int l, char *s, int i, int j, int dirn) {
	/*
	 Return -1 if the word won't fit here,
	 or the number of overlapping letters if
	 it does fit here
	 */

	int dx = ew_lut[dirn];
	int dy = ns_lut[dirn];

	/* Is there room on the grid? */

	if (i + l * dy >= max || i + l * dy < 0)
		return -1;
	if (j + l * dx >= max || j + l * dx < 0)
		return -1;

	/* Do the letters match? */

	int score = 0;

	for (int k = 0; k < l; k++) {
		char c = letter[i][j];

		if (c == s[k])
			score++;
		else if (c != ' ')
			return -1;

		i += dy;
		j += dx;
	}

	return score;
}
void add_word(char *s, char *words[]) {
	for (int j = 0; j < strlen(s); j++)
		if (s[j] < ' ')
			s[j] = '\0';

	words[next_word] = new char[strlen(s) + 1];

	strcpy(words[next_word], s);

	for (int i = 0; i < strlen(words[next_word]); i++)
		if (words[next_word][i] >= 'a' && words[next_word][i] <= 'z')
			words[next_word][i] -= 'a' - 'A';

	next_word++;
	words[next_word] = NULL;
}

int longest(const void *first, const void *second) {
	return strlen(*(char**) second) - strlen(*(char**) first);
}

char** createNewPuzzle(char *str = "weather.txt", int difficulity = 8, bool isRandomPuzzle = false) {
	hardness = difficulity;
	Grid *grid = NULL;
	char s[5000];

	FILE *pFile;
	std::string strFilePath("");
	if(isRandomPuzzle){
		strFilePath.append("data//");
	}
	else {
		strFilePath.append("app//native//assets//wordLists//");
	}

	strFilePath.append(str);
	//perror(strFilePath.c_str());
	pFile = fopen(strFilePath.c_str(), "r");

	if (pFile == NULL) perror ("Error opening file");
	   else {
			while (fgets(s, 5000, pFile) != NULL) {
				if (strlen(s) - 1 < GRID_SIZE) //string has newline char at end
				{
					add_word(s, words);
				}
			}
			fclose (pFile);
	   }

	srand((unsigned)std::time(0));
	grid = new Grid(GRID_SIZE);

	int i = 0;
	QList<int> randList;
	puzzleWords.clear();
	wordIndex.clear();
	while (i < WORD_COUNT) {
		int r = rand() % next_word;

		if(randList.indexOf(r) < 0) { //prevent duplicate words
			randList.append(r);
			if(words[r] != NULL){
				if(grid->fit(words[r])) {
					puzzleWords.append(words[r]);
					i++;
				}
			}
		}
	}

	memset(words, '\0', sizeof words); //fills wordlist buff with 0s
	grid -> garbage () ;
	//grid -> display () ;
	char **letterGrid = grid->returnLetterGrid();

	return letterGrid;
}

QList<char*> returnPuzzleWords() {
	return puzzleWords;
}

int returnNumberOfPuzzleWords() {
	return WORD_COUNT;
}

QMap<QString, int> returnPuzzleIndex() {
	return wordIndex;
}

