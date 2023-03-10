#include <iostream>
#include <fstream>
#include <iomanip>
#include<math.h>
using namespace std;

class Score {
public:
	double calSccore() {
		ifstream fin("D:\\file_score.txt");
		if (!fin) {
			cout << "檔案無法開啟" << endl;
			return 1;
		}
		const int num = 10;
		int test[num];
		for (int i = 0; i < num; i++) {
			fin >> test[i];
		}
		double sum = 0; double avg = 0;
		for (int j = 0; j < num; j++) {
			sum += test[j];
		}
		avg = sum / num;

		return avg;
	}
	void printReport() {
		ifstream fin("D:\\file_score.txt");
		if (!fin) {
			cout << "檔案無法開啟" << endl;
		}
		const int num = 10;
		int test[num];
		for (int i = 0; i < num; i++) {
			fin >> test[i];
			cout << "No." << i + 1 << ": " << test[i] << endl;
		}

	}
};

class Triangle {
private: float Length = 0; float Width = 0; float Height = 0;
public:
	float getLength() {
		return Length;
	}
	float getWidth() {
		return Width;
	}
	float getHeight() {
		return Height;
	}
	float calculate(float l, float w, float h) {

		Length = l; Width = w; Height = h;
		float value = l + w + h;
		return value;
	}
	float calculate2(float l, float w, float h) {
		Length = l; Width = w; Height = h;
		float s;
		s = (l + w + h) / 2;
		float value1 = sqrt(s * (s - l) * (s - w) * (s - h));
		return value1;
	}
};

int main()
{
	Score sc;
	double avg = 0;
	avg = sc.calSccore();
	cout << "平均成績為: " << avg << endl;
	sc.printReport();

	cout << "--------------------" << endl;

	float u, i, o;
	cout << "輸入三邊長" << endl;
	cin >> u >> i >> o;

	if (u != '0' || i != '0' || o != '0')
	{
		cout << "三邊不為0" << "\n";
	}

	Triangle tri;

	float a = tri.calculate(u, i, o);
	float length = tri.getLength();
	float width = tri.getWidth();
	float height = tri.getHeight();
	cout << "Length: " << length << "," << width << "," << height << '\n';
	cout << "Triangle Perimeter: " << a << '\n';

	float b = tri.calculate2(u, i, o);
	cout << "Triangle Area: " << b << "\n";

	return 0;
}