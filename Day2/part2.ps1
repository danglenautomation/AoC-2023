$Total = 0
$Games = Get-Content .\input.txt
foreach($Game in $Games){
    $RedValue = 0
    $BlueValue = 0
    $GreenValue = 0
    $Throws = $Game.split(":")[1].split(";")
    foreach($Throw in $Throws){
        $colours = $Throw.split(",")
        foreach($colour in $colours){

            if ($colour -like "*red"){
                $CountRed = $colour.TrimStart().split(" ")[0]
                $Red = [int]$CountRed
                if($Red -gt $RedValue){
                    $RedValue = $Red
                }
            }
            if ($colour -like "*blue"){
                $CountBlue = $colour.TrimStart().split(" ")[0]
                $Blue = [int]$CountBlue
                if($Blue -gt $BlueValue){
                    $BlueValue = $Blue
                }
            }
            if ($colour -like "*green"){
                $CountGreen = $colour.TrimStart().split(" ")[0]
                $Green = [int]$CountGreen
                if($Green -gt $GreenValue){
                    $GreenValue = $Green
                }
            }
        }
    }

$Total = $RedValue * $GreenValue * $BlueValue
$Answer += $Total 
}

Write-Output "Part 2 Answer: $Answer"


