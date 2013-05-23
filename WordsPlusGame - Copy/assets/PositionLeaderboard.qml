import bb.cascades 1.0

Container {
    id: positionLeaderboardPage
    Leaderboard {
        id: leaderboard
    }
    onCreationCompleted: {
        leaderboard.list.visible = false;
        leaderboard.loader.start();
        wordsPlus.scoreLoop().LoadLeaderboardCompleted.connect(positionLeaderboardPage.handleLeaderboard)
        wordsPlus.loadLeaderboardAroundUser();
    }
    function handleLeaderboard(leaderboardData) {
        leaderboard.loader.stop();
        leaderboard.loader.visible = false;
        leaderboard.list.visible = true;
        leaderboard.model.clear();
        leaderboard.model.insertList(leaderboardData);
    }
}
