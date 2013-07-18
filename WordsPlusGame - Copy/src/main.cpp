// Default empty project template
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>

#include <QLocale>
#include <QTranslator>
#include <Qt/qdeclarativedebug.h>
#include "WordsPlusGame.hpp"

using namespace bb::cascades;

Q_DECL_EXPORT int main(int argc, char **argv)
{
    // this is where the server is started etc
    Application app(argc, argv);

    // localization support
    QTranslator translator;
    QString locale_string = QLocale().name();
    QString filename = QString( "WordsPlusGame_%1" ).arg( locale_string );
    if (translator.load(filename, "app/native/qm")) {
        app.installTranslator( &translator );
    }

	// You can generate one here: http://www.guidgenerator.com/
	const QUuid uuid(QLatin1String("9fc70d32-3634-4335-94a2-56f2257beb63"));

	//Setup BBM registration handler
	RegistrationHandler *registrationHandler = new RegistrationHandler(uuid, &app);
	WordsPlusGame *wordsPlusGame = new WordsPlusGame(registrationHandler->context(), &app);
	//new WordsPlusGame(&app);

    QObject::connect(registrationHandler, SIGNAL(registered()), wordsPlusGame, SLOT(show()));
    registrationHandler->registerApplication();

    // we complete the transaction started in the app constructor and start the client event loop here
    return Application::exec();
    // when loop is exited the Application deletes the scene which deletes all its children (per qt rules for children)
}