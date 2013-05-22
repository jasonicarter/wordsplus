// Default empty project template
#include <bb/cascades/Application>

#include <QLocale>
#include <QTranslator>
#include "applicationui.hpp"

#include "applicationui.hpp"
#include "Countly.hpp"

#include "PaymentServiceControl.hpp"
#include <bb/platform/PaymentManager>

// include JS Debugger / CS Profiler enabler
// this feature is enabled by default in the debug build only
#include <Qt/qdeclarativedebug.h>

using namespace bb::cascades;
using namespace bb::platform;

Q_DECL_EXPORT int main(int argc, char **argv)
{
    // this is where the server is started etc
    Application app(argc, argv);

    // localization support
    QTranslator translator;
    QString locale_string = QLocale().name();
    QString filename = QString( "WordsPlusFree_%1" ).arg( locale_string );
    if (translator.load(filename, "app/native/qm")) {
        app.installTranslator( &translator );
    }


    //new ApplicationUI(&app);

    // You can generate one here: http://www.guidgenerator.com/
    const QUuid uuid(QLatin1String("c82f0d98-47cd-493e-9990-95dcfbae9e42"));

    PaymentManager::setConnectionMode(PaymentConnectionMode::Production);
    //PaymentManager::setConnectionMode(PaymentConnectionMode::Test);

    // Register our class that wraps the C++ PaymentService interface with QML so that we
    // can make calls into the PaymentService and get results, through QML.
    qmlRegisterType<PaymentServiceControl>("com.sample.payment", 1, 0, "PaymentServiceControl");


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
