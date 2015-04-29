import papaya.*;

/*
Modelise et resout une equation matricielle de la forme A*X = B
 */
class Calculator
{
//Ici A[4][4] et B [4][1]
  float[][] A;
  float[][] B;
  QR qr; // Decomposition QR qui permet de resoudre l'equation
  double[][] X;

  Calculator(FloatList angles, FloatList Xp, FloatList Yp) {
    A = new float[4][4];
    B = new float[4][1];
    qr = new QR(A);
    
    for(int i=0; i<A.length;i++){
      A[i][0]=sin(angles.get(i));
      A[i][1]=simulator.temps*sin(angles.get(i));
      A[i][2]=-cos(angles.get(i));
      A[i][3]=-simulator.temps*cos(angles.get(i));
      
      B[i][0]=Xp.get(i)*sin(angles.get(i))-Yp.get(i)*cos(angles.get(i));
    }
    
    
    qr = new QR(A);
  }

//TODO
// problèmes de rang
//calculs effectués à la fin de update_simulator
  void solveSystem() {
    X = qr.solve(B);
    print(X[0][0]+"\n"+X[1][0]+"\n"+X[2][0]+"\n"+X[3][0]+"\n\n");
    double res=A[0][0]*X[0][0]+A[0][1]*X[1][0]+A[0][2]*X[2][0]+A[0][3]*X[3][0];
    print("test: "+res+"\n"+B[0][0]+"\n");
    
  }

  double[][] getResult() {
    return X;
  }
}

