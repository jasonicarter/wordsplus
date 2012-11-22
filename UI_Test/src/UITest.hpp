// Default empty project template
#ifndef UITest_HPP_
#define UITest_HPP_

#include <QObject>

namespace bb { namespace cascades { class Application; }}

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class UITest : public QObject
{
    Q_OBJECT
public:
    UITest(bb::cascades::Application *app);
    virtual ~UITest() {}
};


#endif /* UITest_HPP_ */
