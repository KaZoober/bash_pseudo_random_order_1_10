@test "Check that script is in place" {
    run bash_pseudo_random_order_1_10.sh
}

@test "Check that the generator generates 10 lines" {
    result="bash_pseudo_random_order_1_10.sh"
    [[ "$result | wc - l" =~ "10" ]]
}

@test "Check that the generator generates 10 numbers" {
    run ./bash_pseudo_random_order_1_10.sh
    result=$output
    all_numbers=0
    re='^[0-9]+$'
    for i in $result
    do
        if ! [[ $i =~ $re ]] ; then
            all_numbers=1
        fi
    done
    [ $all_numbers = 0 ] 
}

#Absolutely terrible. Two runs. Can do better. Return once rested
@test "Check that the generator generates 10 different numbers" {
    run ./bash_pseudo_random_order_1_10.sh
    result=$output
    counter=(0 0 0 0 0 0 0 0 0 0)
    out=0
    for i in $result
    do
        counter[$i-1]=1
    done
    for i in ${counter[@]}
    do
        let out+=$i
    done
    [ $out = 10 ]
}