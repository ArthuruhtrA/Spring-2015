<?php
/* filename: fizzbuzz.php
 * author: Ari Sanders
 * date: 1/28/2015
 * last-modified: 1/29/2015
 */

//Loop through all numbers 1-100 inclusive
for ($i = 1; $i <= 100; $i++){
    $string = "";
    //Fizz for multiples of 5
    if ($i % 5 === 0){
        $string = "Fizz";
    }
    //Buzz for multiples of 7
    if ($i % 7 === 0){
        $string .= "Buzz";
    }
    //Integer for all others
    if ($string === ""){
        $string = $i;
    }
    //Print the resultant string
    print $string."\n";
}

?>
