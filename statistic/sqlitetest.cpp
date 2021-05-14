#include <iostream>
#include <sqlite3.h>

using namespace std;

int main(int argc, char* argv[])
{
   sqlite3 *db;
   char *zErrMsg = 0;
   int rc;

   rc = sqlite3_open("inst.db", &db);

   if( rc ){
    //   fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(db));
        cout << "Can't open database: " <<  sqlite3_errmsg(db) << endl;
        return -1;
    //   exit(0);
   }else{
    //   fprintf(stderr, "Opened database successfully\n");
        cout << "done" << endl;
   }

    string sql = "INSERT INTO INSTRUMENTATION (FILE, STORE, ICALL, RET, SUM) VALUES "\
                "(";

    rc = sql
   sqlite3_close(db);
   return 0;
}