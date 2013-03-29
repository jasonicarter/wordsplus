// Default empty project template
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>

#include <QLocale>
#include <QTranslator>
#include <Qt/qdeclarativedebug.h>
#include "WordsPlusFree.hpp"

using namespace bb::cascades;

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

	// You can generate one here: http://www.guidgenerator.com/
	const QUuid uuid(QLatin1String("c82f0d98-47cd-493e-9990-95dcfbae9e42"));

	//Setup BBM registration handler
	RegistrationHandler *registrationHandler = new RegistrationHandler(uuid, &app);
	WordsPlusFree *wordsPlusFree = new WordsPlusFree(registrationHandler->context(), &app);
	//new WordsPlusGame(&app);

    QObject::connect(registrationHandler, SIGNAL(registered()), wordsPlusFree, SLOT(show()));
    registrationHandler->registerApplication();

    // we complete the transaction started in the app constructor and start the client event loop here
    return Application::exec();
    // when loop is exited the Application deletes the scene which deletes all its children (per qt rules for children)
}
