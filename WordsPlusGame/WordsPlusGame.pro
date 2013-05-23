APP_NAME = WordsPlusGame

CONFIG += qt warn_on cascades10

CONFIG += mobility
MOBILITY += sensors

LIBS += -lbbsystem
LIBS += -lscoreloopcore
LIBS += -lbbmultimedia
LIBS += -lOpenAL -lalut -lasound
LIBS += -lbbplatformbbm
LIBS += -lbb -lbbdata -lbbplatform -lbbdevice

include(config.pri)
