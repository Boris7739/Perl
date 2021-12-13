#!usr/bin/perl
use DBI;
my $host = "localhost";
my $port = "3306";
my $user = "agent";
my $pass = "agent";
my $db = "zabbix_db";

$dbh = DBI->connect("DBI:mysql:$db:$host:$port",
$user, $pass);
$sth = $dbh->prepare("select sum(data_length + index_length)/1024/1024 FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'zabbix_db'");
$sth->execute;

while ($ref = $sth->fetchrow_arrayref) {
if("$$ref[0]">0){
print "$$ref[0]\n"
}
}
$rc = $sth->finish;
$rc = $dbh->disconnect;