AMOUNT=10
TEST_FILE="src/test.mo"
rm -f $TEST_FILE
touch $TEST_FILE
for i in $(seq 1 $AMOUNT)
do 
    FILE="src/extra/module$i.mo"
    rm -f $FILE
    touch $FILE
    for other in $(seq $(($i+1)) $AMOUNT)
    do
        echo "import Module$other \"module$other\";" >> $FILE
    done
    echo "module {  }" >> $FILE
    echo "import Module$i \"extra/module$i\";" >> $TEST_FILE
done
echo "import Prim \"mo:prim\";" >> $TEST_FILE
echo "actor {" >> $TEST_FILE
echo "  public func run(): async () {" >> $TEST_FILE
echo "     Prim.debugPrint(\"Done\");" >> $TEST_FILE
echo "  }" >> $TEST_FILE
echo "}" >> $TEST_FILE
