import bb.cascades 1.0

Container {
    id: topLeaderboardPage
    property bool includeBuddyList: false
    Leaderboard {
        id: leaderboard
    }
    onCreationCompleted: {
        leaderboard.list.visible = false;
        leaderboard.loader.start();
        wordsPlus.scoreLoop().LoadLeaderboardCompleted.connect(topLeaderboardPage.handleLeaderboard)
        wordsPlus.loadLeaderboard(includeBuddyList);
    }
    function handleLeaderboard(leaderboardData) {
        leaderboard.loader.stop();
        leaderboard.loader.visible = false;
        leaderboard.list.visible = true;
        leaderboard.model.clear();
        leaderboard.model.insertList(leaderboardData);
    }
}
