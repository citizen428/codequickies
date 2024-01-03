$1 % 3 == 0 { strings[$1]="Fizz" }
$1 % 5 == 0 { strings[$1]="Buzz" }
!strings[$1] { strings[$1]=$1 }

END { for (s in strings) print strings[s] }
