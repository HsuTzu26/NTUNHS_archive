#include <iostream>
#include <stdlib.h>
#include <fstream>
#include <iomanip>
using namespace std;
using std::string;

int main()
{
	ifstream fin("D:\\fin-test-file.txt");
	ofstream fout("D:\\fout-test-file.txt");
	if (!fin) {
		cout << "無法開啟fin檔案。\n";
		return 1;
	}
	else
		cout << "fin檔案已開啟。\n";

	if (!fout) {
		cout << "無法開啟fout檔案。\n";
		return 1;
	}
	else
		cout << "fout檔案已開啟。\n";

	const int num = 5;
	int test[num];
	test[0] = 0;
	int value = test[0];
	for (int i = 0; i < num; i++) {
		fin >> test[i];
	}
	for (int j = 0; j < num; j++) {
		int value = pow(test[j], 2);
		fout << value << endl;
	}


	fin.close();
	cout << "fin檔案已關閉。\n";
	fout.close();
	cout << "fout檔案已關閉。\n";
	return 0;

}