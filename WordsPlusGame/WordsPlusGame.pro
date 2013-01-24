APP_NAME = WordsPlusGame

CONFIG += qt warn_on cascades10

CONFIG += mobility
MOBILITY += sensors

LIBS += -lbbsystem
LIBS += -lscoreloopcore -lbbsystem
LIBS += -lbbmultimedia
LIBS += -lOpenAL -lalut -lasound
LIBS += -lbbplatformbbm

include(config.pri)
