import 'package:flutter/material.dart';
import 'package:login_v2/home.dart';

void main() {
  runApp(const MyApp());
}

// ======================= APP ===========================
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  void toggleTheme(bool value) {
    setState(() {
      isDark = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: isDark ? AppThemes.darkTheme : AppThemes.lightTheme,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: MaterialApp(
        theme: isDark ? AppThemes.darkTheme : AppThemes.lightTheme,
        home: LoginScreen(onThemeChanged: toggleTheme),
        routes: {'/home': (context) => const HomeScreen()},
      ),
    );
  }
}

// ======================= TEMAS PERSONALIZADOS ===========================
class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Color(0xFF4D15E7),
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(90.0)),
      filled: true,
      fillColor: const Color(0xFFF5F5F5),
      labelStyle: const TextStyle(color: Colors.black87),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2D5CF5),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: const Color.fromARGB(255, 4, 3, 71),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 4, 3, 71),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(90.0)),
      filled: true,
      fillColor: const Color(0xFF282828),
      labelStyle: const TextStyle(color: Colors.white70),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2D5CF5),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
    ),
  );
}

// ======================= LOGIN SCREEN ===========================
class LoginScreen extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;

  const LoginScreen({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ThemeSwitch(initialValue: isDark, onChanged: onThemeChanged),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Icon(Icons.wallet_rounded, size: 120, color: Colors.green),

              // Campo Email
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Email'),
                ),
              ),

              // Campo Senha
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
              ),

              // Botão Login
              Padding(
                padding: const EdgeInsets.fromLTRB(170, 20, 170, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),

              // Botão Registro
              Padding(
                padding: const EdgeInsets.fromLTRB(170, 10, 170, 10),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Registro',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),

              // Esqueceu a senha
              TextButton(
                onPressed: () {},
                child: const Text('Forgot Password?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ======================= THEME SWITCH ===========================
class ThemeSwitch extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const ThemeSwitch({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  late bool isDark;

  @override
  void initState() {
    super.initState();
    isDark = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant ThemeSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      setState(() => isDark = widget.initialValue);
    }
  }

  void toggle() => widget.onChanged(!isDark);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: 60,
        height: 34,
        decoration: BoxDecoration(
          color: isDark ? Colors.black : Colors.blue,
          borderRadius: BorderRadius.circular(34),
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            AnimatedOpacity(
              opacity: isDark ? 1 : 0,
              duration: const Duration(milliseconds: 400),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.star, size: 8, color: Colors.white),
                  Icon(Icons.star, size: 10, color: Colors.white),
                  Icon(Icons.star, size: 6, color: Colors.white),
                ],
              ),
            ),
            AnimatedAlign(
              duration: const Duration(milliseconds: 400),
              alignment: isDark ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(4),
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark ? Colors.white : Colors.yellow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
