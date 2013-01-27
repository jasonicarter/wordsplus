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

	// Every application is required to have its own unique UUID. You should
	// keep using the same UUID when you release a new version of your application.
	//TODO:  YOU MUST CHANGE THIS UUID!
	// You can generate one here: http://www.guidgenerator.com/
	const QUuid uuid(QLatin1String("9fc70d32-3634-4335-94a2-56f2257beb63"));

	//Setup BBM registration handler
	//RegistrationHandler *registrationHandler = new RegistrationHandler(uuid, &app);

	//AppName.cpp file which contains your main.qml file
	//WordsPlusGame *wordsPlusGame = new WordsPlusGame(registrationHandler->context(), &app);
	new WordsPlusGame(&app);

    // Whenever the registration has finished successfully, we continue to the main UI
    // Added finishRegistration() to registrationFinished()
    // This is to emit signal and by pass use of continue button as shown in sample
    //QObject::connect(registrationHandler, SIGNAL(registered()), wordsPlusGame, SLOT(show()));

    // we complete the transaction started in the app constructor and start the client event loop here
    return Application::exec();
    // when loop is exited the Application deletes the scene which deletes all its children (per qt rules for children)
}
