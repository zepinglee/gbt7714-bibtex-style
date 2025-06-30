save_file () {
    test="$1";
    for config in main bbl bibunits chapterbib; do
        if [[ "$config" == "main" ]]; then
            test_dir="tests/testfiles";
        else
            test_dir="tests/testfiles-$config";
        fi
        file_path="$test_dir/$test.tex";
        if [ -f "$file_path" ]; then
            if [[ "$config" == "main" ]]; then
                l3build save "$test" || exit 1;
            else
                l3build save --config "tests/config-$config" "$test" || exit 1;
            fi
            break;
        fi
    done
}

save_config () {
    config="$1";
    if [[ "$config" == "main" ]]; then
        for testfile in tests/testfiles/*.tex; do
            test="$(basename "$testfile" .tex)";
            l3build save "$test" || exit 1;
        done
    else
        for testfile in "tests/testfiles-$config"/*.tex ; do
            test="$(basename "$testfile" .tex)";
            l3build save --config "tests/config-$config" "$test" || exit 1;
        done
    fi
}


if [[ $# -eq 0 ]]; then
    for config in main bbl bibunits chapterbib; do
        save_config $config;
    done
else
    case $1 in
        main|bbl|bibunits|chapterbib)
            save_config "$1";
            ;;

        *)
            save_file "$1";
            ;;
    esac
fi
