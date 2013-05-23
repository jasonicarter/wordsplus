import bb.cascades 1.0

Container {
    id: achievementsPage
    AchievementList {
        id: achievements
    }
    onCreationCompleted: {
        achievements.list.visible = false;
        achievements.loader.start();
        wordsPlus.scoreLoop().LoadAchievementsCompleted.connect(achievementsPage.handleAchievements)
        wordsPlus.LoadAchievementsAwards();
    }
    function handleAchievements(achievementData) {
        achievements.loader.stop();
        achievements.loader.visible = false;
        achievements.list.visible = true;
        achievements.model.clear();
        achievements.model.insertList(achievementData);
    }
}
