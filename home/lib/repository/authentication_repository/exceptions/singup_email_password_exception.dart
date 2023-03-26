class SignUpWithEmailPasswordFailure {
  final String message;

  const SignUpWithEmailPasswordFailure(
      [this.message = "An Unknown error has occurred."]);

  factory SignUpWithEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailPasswordFailure(
            'Please enter a stronger password.');
      case 'invalid-email':
        return const SignUpWithEmailPasswordFailure(
            'Email is not a valid or baddly formatted.');
      case 'email-already-in-use':
        return const SignUpWithEmailPasswordFailure(
            'An account already exists for the specified email.');
      case 'operation-not-allowed':
        return const SignUpWithEmailPasswordFailure(
            'Operation not allowed, Please contact the Support Team.');
      case 'user-disabled':
        return const SignUpWithEmailPasswordFailure(
            'This user has been disabled, Please contact the Support Team');
      default:
        return const SignUpWithEmailPasswordFailure();
    }
  }
}
