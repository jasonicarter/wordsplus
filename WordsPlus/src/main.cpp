// Default empty project template
#include <bb/cascades/Application>

#include <QLocale>
#include <QTranslator>
#include "applicationui.hpp"

#include "applicationui.hpp"

// include JS Debugger / CS Profiler enabler
// this feature is enabled by default in the debug build only
#include <Qt/qdeclarativedebug.h>

using namespace bb::cascades;

Q_DECL_EXPORT int main(int argc, char **argv)
{
    // this is where the server is started etc
    Application app(argc, argv);

    // localization support
    QTranslator translator;
    QString locale_string = QLocale().name();
    QString filename = QString( "WordsPlus_%1" ).arg( locale_string );
    if (translator.load(filename, "app/native/qm")) {
        app.installTranslator( &translator );
    }


    //new ApplicationUI(&app);

    // You can generate one here: http://www.guidgenerator.com/
	const QUuid uuid(QLatin1String("db386568-22e9-41a8-9a4b-c3db02d5a6a7"));

	//Setup BBM registration handler
	RegistrationHandler *registrationHandler = new RegistrationHandler(uuid, &app);
	ApplicationUI *wordsPlus = new ApplicationUI(registrationHandler->context(), &app);

	QObject::connect(registrationHandler, SIGNAL(registered()), wordsPlus, SLOT(show()));
	registrationHandler->registerApplication();


    // we complete the transaction started in the app constructor and start the client event loop here
    return Application::exec();
    // when loop is exited the Application deletes the scene which deletes all its children (per qt rules for children)
}
