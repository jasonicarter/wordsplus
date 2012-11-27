// Default empty project template
#include "CascadesScoreloopSample.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>

#include "ScoreLoopThread.hpp"

using namespace bb::cascades;
using namespace bb::system;

CascadesScoreloopSample::CascadesScoreloopSample(bb::cascades::Application *app)
: QObject(app)
{
	qmlRegisterType<SystemToast>("my.systemToasts",1,0,"SystemToast");
	qmlRegisterType<ScoreLoopThread>("com.redlightoflove", 1, 0, "ScoreLoop");

    // create scene document from main.qml asset
    // set parent to created document to ensure it exists for the whole application lifetime
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);



    mScoreLoop = ScoreLoopThread::instance();

   	QObject::connect(mScoreLoop, SIGNAL(ScoreLoopUserReady(AppData_t*)), this, SLOT(scoreLoopLoaded(AppData_t*)));
   	QObject::connect(mScoreLoop, SIGNAL(SubmitScoreCompleted(ScoreData_t*)), this, SLOT(onSubmitScoreCompleted(ScoreData_t*)));

	qml->setContextProperty("app", this);

    // create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();

    // set created root object as a scene
    app->setScene(root);

    mScoreLoop->start();
}


/************
 * SLOTS
 ************/
void CascadesScoreloopSample::scoreLoopLoaded(AppData_t *data)
{
	mAppData = data;
}

void CascadesScoreloopSample::onSubmitScoreCompleted(ScoreData_t *scoreData)
{
	mLastScoreData = scoreData;
	emit(submitScoreCompleted());
}


/***********
 * QML HELPERS
 ***********/
void CascadesScoreloopSample::submitScore(int score)
{
	ScoreLoopThread::SubmitScore(mAppData, score, 0);
}

void CascadesScoreloopSample::loadLeaderboard()
{
	ScoreLoopThread::LoadLeaderboard(mAppData, SC_SCORES_SEARCH_LIST_ALL, 15);
}

void CascadesScoreloopSample::loadLeaderboardAroundLastScore()
{
	ScoreLoopThread::LoadLeaderboardAroundScore(mAppData, mLastScoreData->score, SC_SCORES_SEARCH_LIST_ALL, 15);
}

ScoreLoopThread* CascadesScoreloopSample::scoreLoop()
{
	return ScoreLoopThread::instance();
}
