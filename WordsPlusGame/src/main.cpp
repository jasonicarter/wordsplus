// Default empty project template
#include <bb/cascades/Application>

#include <QLocale>
#include <QTranslator>
#include "applicationui.hpp"

#include "applicationui.hpp"
#include "Countly.hpp"

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
    QString filename = QString( "WordsPlusGame_%1" ).arg( locale_string );
    if (translator.load(filename, "app/native/qm")) {
        app.installTranslator( &translator );
    }

    //new ApplicationUI(&app);

    // You can generate one here: http://www.guidgenerator.com/
    const QUuid uuid(QLatin1String("9fc70d32-3634-4335-94a2-56f2257beb63"));


	//Setup BBM registration handler
	RegistrationHandler *registrationHandler = new RegistrationHandler(uuid, &app);
	ApplicationUI *wordsPlus = new ApplicationUI(registrationHandler->context(), &app);

	QObject::connect(registrationHandler, SIGNAL(registered()), wordsPlus, SLOT(show()));
	registrationHandler->registerApplication();


	//countly::CountlyInit(&app, "https://cloud.count.ly", "34e7571ac2c7b2a9d155fd70608ea0914963ed2e"); //test id

    // we complete the transaction started in the app constructor and start the client event loop here
    return Application::exec();
    // when loop is exited the Application deletes the scene which deletes all its children (per qt rules for children)
}
