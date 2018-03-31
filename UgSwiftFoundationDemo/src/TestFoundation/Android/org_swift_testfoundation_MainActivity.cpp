
#include "org_swift_testfoundation_MainActivity.h"
#include <thread>
#include <vector>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <android/log.h>


#define LaunchTestFoundation _T014TestFoundation06LaunchaB0yyF

extern "C" void LaunchTestFoundation();


static void redirectStdoutThreadFunc(int fd) {
    std::vector<char> buf;
    buf.resize(256);
    size_t nread = 0;

    while (true) {
        auto res = ::read(fd, &buf[nread], buf.size() - nread);
        if (res <= 0) {
            // error or EOF
            break;
        }

        // looking for new line
        size_t newStart = 0;
        for (auto i = nread; i < nread + res; ++i) {
            if (buf[i] == '\n') {
                buf[i] = 0;
                __android_log_write(ANDROID_LOG_DEBUG, "SwiftTestFoundation", &buf[newStart]);
                newStart = i + 1;
            }
        }

        nread += res;

        // move end of buffer to begining
        if (newStart != 0) {
            std::copy(buf.begin() + newStart,
                      buf.begin() + nread,
                      buf.begin());
            nread = nread - newStart;
        }

        // resizing buffer if needed
        if (nread == buf.size()) {
            buf.resize(buf.size() * 2);
        }
    }
}


// Redirects stdout/stderr to logcat
static void redirectStdout() {
    // disable buffering for stdout/stderr
    ::setvbuf(stdout, 0, _IONBF, 0);
    ::setvbuf(stderr, 0, _IONBF, 0);

    // creating pipe and redirecting stdout/stderr
    int redirectPipe[2];
    ::pipe(redirectPipe);
    ::dup2(redirectPipe[1], 1);
    ::dup2(redirectPipe[1], 2);

    // starting redirect thread
    std::thread thrd{[redirectPipe] {
        redirectStdoutThreadFunc(redirectPipe[0]);
    }};

    thrd.detach();
}


JNIEXPORT void JNICALL Java_org_swift_testfoundation_MainActivity_launchTestFoundation
  (JNIEnv * env, jobject obj) {

    redirectStdout();

    printf("SWIFT TESTFOUNDATION START\n");
    LaunchTestFoundation();
    printf("SWIFT TESTFOUNDATION END\n");
}


