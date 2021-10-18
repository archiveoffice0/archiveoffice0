#!/usr/bin/perl

$result =`cat /proc/meminfo | grep MemFree:`;
@val = split(/:/, $result);
$val[1] =~ s/^\s+|\s+$//g;
@v = split(/ /, $val[1]);
print "$v[0]\n";
if($v[0] < 500000)
{
        print "less than 500000";
        $cmd = "service mysqld restart; service httpd restart";
        system("bash -c '$cmd'");
}
else
{
        print "more than 500000";;

}

