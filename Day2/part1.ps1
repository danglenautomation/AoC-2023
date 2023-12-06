$ValidationRed = 12
$ValidationGreen = 13
$ValidationBlue = 14
$Total = 0


$Games = Get-Content .\input.txt
foreach($Game in $Games){
    $Valid = "True"
    $GameID = $Game.split(":")[0].split(" ")[1]
    $Throws = $Game.split(":")[1].split(";")
    foreach($Throw in $Throws){
        $colours = $Throw.split(",")
        foreach($colour in $colours){

            if ($colour -like "*red"){
                $CountRed = $colour.TrimStart().split(" ")[0]
                if([int]$CountRed -gt $ValidationRed){
                    $Valid = "False"
                }
            }
            if ($colour -like "*blue"){
                $CountBlue = $colour.TrimStart().split(" ")[0]
                if([int]$CountBlue -gt $ValidationBlue){
                    $Valid = "False"
                }
            }
            if ($colour -like "*green"){
                $CountGreen = $colour.TrimStart().split(" ")[0]
                if([int]$CountGreen -gt $ValidationGreen){
                    $Valid = "False"
                }
            }
        }

    }
    if($Valid -eq "True"){
        $Total += $GameID}

}

Write-Output "Part 1 Answer: $Total"
