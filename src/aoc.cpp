#include <getopt.h>
#include <iostream>
#include <string>

struct config {
    std::string year;
    int day;
    int part;
};

void help() {
    std::cout <<
        "\t -y|--year <year>     advent of code year\n"
        "\t -d|--day <day>       advent of code day\n"
        "\t -p|--part <part>     part of the problem\n"
        "\t -h|--help            print this message\n";
    exit(1);
}

void parse_opts(int argc, char** argv, config *retval) {
    const char* const short_opts = "y:d:p:h";
    const option long_opts[] = {
        {"year",    required_argument,  nullptr, 'y'},
        {"day",     required_argument,  nullptr, 'd'},
        {"part",    required_argument,  nullptr, 'p'},
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
            retval->day = std::stoi(optarg);
            break;

        case 'p':
            retval->part = std::stoi(optarg);
            break;

        case 'h':
        case '?':
        default:
            help();
            break;
        }
    }
}

bool validate_opts(config conf) {

}

int main(int argc, char** argv) {
    config conf;
    parse_opts(argc, argv, &conf);
    std::cout << conf.year << " "
              << conf.day << " "
              << conf.part << " "
              << std::endl;
}