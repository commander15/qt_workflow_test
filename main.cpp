#include <QCoreApplication>
#include <QTextStream>
#include <QThread>

QString userName();
QString computerName();

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);
    app.setApplicationName("Qt Workflow Test");
    app.setApplicationVersion("1.0");
    app.setOrganizationName("Commander Systems");

    // IO Streams
    QTextStream out(::stdout);

    // Greeting
    out << "Hello " << userName() << " on " << computerName() << " !" << Qt::endl;

    // Count from 1 to 10 in 10 seconds
    for (int i(1) ; i <= 10; ++i) {
        out << i << Qt::endl;
        QThread::msleep(1000);
    }

    // Say good bye
    out << "Bye bye" << Qt::endl;

    return 0;
}

QString userName()
{
    const QString defaultName = QStringLiteral("Dear");

#ifdef Q_OS_LINUX
    return qEnvironmentVariable("USER", defaultName);
#elif defined(Q_OS_WIN)
    return qEnvironmentVariable("USERNAME", defaultName);
#else
    return defaultName;
#endif
}

QString computerName()
{
    return QSysInfo::machineHostName();
}
