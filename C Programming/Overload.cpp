#include <iostream>
using namespace std;

class Calculation {
private:
	float a;
	float b;
	float c;
public:
	float area(float a, float b) {
		cout << "The area is: " << a * b << endl;
		return a * b;
	}
	float volume(float a, float b, float c) {
		cout << "The volume is: " << a * b * c << endl;
		return a * b * c;
	}
};


int main()
{
	Calculation cal;
	float x, y, z; float area_1, volume_1;
	cout << "Please enter the parameters: " << endl;
	cout << "Length: " << endl;
	cin >> x;
	cout << "Width: " << endl;
	cin >> y;
	cout << "Height: " << endl;
	cin >> z;

	area_1 = cal.area(x, y);
	volume_1 = cal.volume(x, y, z);

	return 0;
}