// Default empty project template
#ifndef CascadesScoreloopSample_HPP_
#define CascadesScoreloopSample_HPP_

#include <QObject>
#include "ScoreLoopThread.hpp"
#include <bb/system/SystemToast>

namespace bb { namespace cascades { class Application; }}

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class CascadesScoreloopSample : public QObject
{
    Q_OBJECT
public:
    CascadesScoreloopSample(bb::cascades::Application *app);
    virtual ~CascadesScoreloopSample() {}

    Q_INVOKABLE void submitScore(int score);
    Q_INVOKABLE void loadLeaderboard();
    Q_INVOKABLE void loadLeaderboardAroundLastScore();
    Q_INVOKABLE ScoreLoopThread* scoreLoop();

public slots:
	void scoreLoopLoaded(AppData_t *data);
	void onSubmitScoreCompleted(ScoreData_t *scoreData);

signals:
	void submitScoreCompleted();

private:
	AppData_t *mAppData;
	ScoreLoopThread *mScoreLoop;
	ScoreData_t *mLastScoreData;
};


#endif /* CascadesScoreloopSample_HPP_ */
