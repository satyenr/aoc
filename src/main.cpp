#include <getopt.h>
#include <libgen.h>
#include <iostream>
#include <string>

struct config {
    std::string year;
    std::string day;
};

void help(char* progname) {
    std::cout << "Advent of Code (C++)\n\n"
                 "Usage: "
              << progname
              << " (-y|--year YEAR) (-d|--day DAY)\n\n"
                 "Available options:\n"
                 "  -y, --year YEAR         advent of code year\n"
                 "  -d, --day DAY           advent of code day for the given year\n"
                 "  -h, --help              show this help message\n";
}

void parse_opts(int argc, char** argv, config *retval) {
    const char* const short_opts = "y:d:p:h";
    const option long_opts[] = {
        {"year",    required_argument,  nullptr, 'y'},
        {"day",     required_argument,  nullptr, 'd'},
        {"help",    no_argument,        nullptr, 'h'},
        {nullptr,   0,                  nullptr,  0 }
    };

    int option_index = 0;

    while (true) {
        const auto opt = getopt_long(argc, argv, short_opts, long_opts, &option_index);
        if (-1 == opt) break;

        switch (opt) {
            case 'y':
                retval->year = std::string(optarg);
                break;

            case 'd':
                retval->day = std::string(optarg);
                break;

            case 'h':
            case '?':
            default:
                help(basename(argv[0]));
                exit(0);
        }
    }
}

int main(int argc, char** argv) {
    config conf;
    parse_opts(argc, argv, &conf);
    std::cout << conf.year << " "
    << conf.day << " "
    << std::endl;
}