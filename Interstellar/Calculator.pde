import papaya.*;

/*
Modelise et resout une equation matricielle de la forme A*X = B
 */
class Calculator
{
//Ici A[4][4] et B [4][1]
  float[][] A;
  float[][] B;
  float[][] T;
  QR qr; // Decomposition QR qui permet de resoudre l'equation
  double[][] X;

  Calculator(FloatList angles, FloatList Xp, FloatList Yp) {
    A = new float[4][4];
    B = new float[4][1];
    T = new float[4][1];
    T[0][0]=simulator.temps-3;
    T[1][0]=simulator.temps-2;
    T[2][0]=simulator.temps-1;
    T[3][0]=simulator.temps;
    
    for(int i=0; i<A.length;i++){
      float angle=angles.get(i);
      A[i][0]=sin(angle);
      A[i][1]=T[i][0]*sin(angle);
      A[i][2]=-cos(angle);
      A[i][3]=-T[i][0]*cos(angle);
      
      B[i][0]=Xp.get(i)*sin(angle)-Yp.get(i)*cos(angle);
    }
    
    qr = new QR(A);
  }

//TODO
// problèmes de rang
//calculs effectués à la fin de update_simulator
  void solveSystem() {
    X = qr.solve(B);
    Mat.print(X,5);
    double res=A[0][0]*X[0][0]+A[0][1]*X[1][0]+A[0][2]*X[2][0]+A[0][3]*X[3][0];
    print("test: "+res+"\n"+B[0][0]+"\n\n");
    
  }

  double[][] getResult() {
    return X;
  }
}

