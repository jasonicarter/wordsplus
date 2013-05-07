// Default empty project template
#include <bb/cascades/Application>

#include <QLocale>
#include <QTranslator>
#include "applicationui.hpp"


#include "PaymentServiceControl.hpp"
#include <bb/platform/PaymentManager>

// include JS Debugger / CS Profiler enabler
// this feature is enabled by default in the debug build only
#include <Qt/qdeclarativedebug.h>

#include "Countly.hpp"

using namespace bb::cascades;
using namespace bb::platform;

Q_DECL_EXPORT int main(int argc, char **argv)
{
    // this is where the server is started etc
    Application app(argc, argv);
    countly::CountlyInit(&app, "https://cloud.count.ly", "34e7571ac2c7b2a9d155fd70608ea0914963ed2e");

    // localization support
    QTranslator translator;
    QString locale_string = QLocale().name();
    QString filename = QString( "SequentTiles_%1" ).arg( locale_string );
    if (translator.load(filename, "app/native/qm")) {
        app.installTranslator( &translator );
    }

    PaymentManager::setConnectionMode(PaymentConnectionMode::Production);
    //PaymentManager::setConnectionMode(PaymentConnectionMode::Test);

    // Register our class that wraps the C++ PaymentService interface with QML so that we
    // can make calls into the PaymentService and get results, through QML.
    qmlRegisterType<PaymentServiceControl>("com.sample.payment", 1, 0, "PaymentServiceControl");

    new ApplicationUI(&app);

    // we complete the transaction started in the app constructor and start the client event loop here
    return Application::exec();
    // when loop is exited the Application deletes the scene which deletes all its children (per qt rules for children)
}
