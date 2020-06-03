
git for-each-ref --merged PRODUCTION --sort='-committerdate' --format='%(committerdate:short), %(refname:short)' refs/remotes/origin/promotion  | foreach-object { $branchdate=[datetime]::ParseExact($_.Split(",")[0], 'yyyy-MM-dd', $null ); $branchname=$_.Split(",")[1].Replace("origin/",""); if ($branchdate -le $cutoffdate) {write-output "Older branch:$branchdate ::$branchname"}}


git branch -r --merged 'PRODUCTION' -l '*promotion*' --sort=-committerdate --format="%(committerdate:short),%(refname:short)"  | foreach-object { $branchdate=[datetime]::ParseExact($_.Split(",")[0], 'yyyy-MM-dd', $null ); $branchname=$_.Split(",")[1].Replace("origin/",""); if ($branchdate -le $cutoffdate) {write-output "Older branch:$branchdate ::$branchname"}}
