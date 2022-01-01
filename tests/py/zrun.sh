
gen_root=/Users/a4z/work/xlcpp/example-cc/generated
project_root=/Users/a4z/work/xlcpp/example-cc

export PYTHONPATH=${gen_root}/cpplib/djinni/python:$PYTHONPATH
export LIBRARY_PATH=${project_root}/build/lib:${project_root}/tests/py
export LD_LIBRARY_PATH=${project_root}/build/lib:${project_root}/tests/py
export DYLD_LIBRARY_PATH=${project_root}/build/lib:${project_root}/tests/py
#echo "HERE: $headers"


python check.py




