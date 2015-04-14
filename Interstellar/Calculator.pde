import papaya.*;

/*
Modelise et resout une equation matricielle de la forme A*X = B
 */

class Calculator
{

  float[][] A;
  float[][] B;
  QR qr; // Decomposition QR qui permet de resoudre l'equation
  double[][] X;

  void Calculator(float[][] A, float[][] B) {
    this.A = A;
    this.B = B;
    qr = new QR(A);
  }

  void Calculator(float[] angles, float[] Xp, float[] Yp) {
    // Ajouter eventuellement des securites sur la taille des matrices
    
    /*
    TODO:
    Definir les matrices A et B en fonction des infos passees en parametres
    Sachant que
      angles est le vecteur contenant les 4 mesures d'angles
      Xp est le vecteur contenant les 4 positions x de l'observateur
      Yp est le vecteur contenant les 4 positions y de l'observateur
      
      NICO A LA FEUILLE QUI EXPLIQUE CE QUE CONTIENNENT LES DEUX MATRICES
    */
    
    qr = new QR(A);
  }

  void solveSystem() {
    X = qr.solve(B);
  }

  double[][] getResult() {
    return X;
  }
}

