import 'package:flutter/material.dart';
import 'package:login_v2/home.dart';

void main() {
  runApp(const MyApp());
}

// Classe principal com suporte a tema dinâmico
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(
          isDark: isDark,
          onThemeChanged: (value) {
            setState(() => isDark = value);
          },
        ),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  final bool isDark;
  final ValueChanged<bool> onThemeChanged;

  const LoginScreen({
    super.key,
    required this.isDark,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.wallet_rounded,
                size: 120,
                color: Color.fromARGB(255, 36, 95, 38),
              ),

              // Campo Email
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(90.0)),
                    ),
                    labelText: 'Email',
                  ),
                ),
              ),

              // Campo Senha
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(90.0)),
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),

              // Botão Login
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 20, 100, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color.fromARGB(255, 31, 102, 14),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),

              // Botão Registro
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color.fromARGB(255, 31, 102, 14),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Registro',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),

              // Esqueceu a senha
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Color.fromARGB(255, 223, 32, 32)),
                ),
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
    this.initialValue = false,
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

  void toggle() {
    setState(() => isDark = !isDark);
    widget.onChanged(isDark);
  }

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
            // Estrelas (visíveis no dark)
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

            // Sol/Lua
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
                child: Stack(
                  children: [
                    if (isDark)
                      Positioned(
                        left: 6,
                        top: 6,
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
