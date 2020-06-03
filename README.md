# git_utilities

Below command will list git branches with committer date older than a certain cutoff date .  you can list the latest branches by simply changing the comparison switch from -le to -ge.  

This can be executed in a powershell prompt .

$cutoffdate = "2020-03-01" 
$cutoffdate=[datetime]::ParseExact("$cutoffdate", 'yyyy-MM-dd', $null);


git for-each-ref --merged PRODUCTION --sort='-committerdate' --format='%(committerdate:short), %(refname:short)' refs/remotes/origin/promotion  | foreach-object { $branchdate=[datetime]::ParseExact($_.Split(",")[0], 'yyyy-MM-dd', $null ); $branchname=$_.Split(",")[1].Replace("origin/",""); if ($branchdate -le $cutoffdate) {write-output "Older branch:$branchdate ::$branchname"}}


git branch -r --merged 'PRODUCTION' -l '*promotion*' --sort=-committerdate --format="%(committerdate:short),%(refname:short)"  | foreach-object { $branchdate=[datetime]::ParseExact($_.Split(",")[0], 'yyyy-MM-dd', $null ); $branchname=$_.Split(",")[1].Replace("origin/",""); if ($branchdate -le $cutoffdate) {write-output "Older branch:$branchdate ::$branchname"}}
