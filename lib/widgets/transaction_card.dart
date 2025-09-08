import 'package:flutter/material.dart';

class TransactionCard extends StatefulWidget {
  const TransactionCard({super.key});

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard>
    with SingleTickerProviderStateMixin {
  bool _hovering = false;
  late AnimationController _controller;
  late Animation<double> _cardSlide;
  late Animation<double> _postSlide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _cardSlide = Tween<double>(begin: 0, end: -70).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );

    _postSlide = Tween<double>(begin: 0, end: -70).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );
  }

  void _onHover(bool hovering) {
    setState(() {
      _hovering = hovering;
      if (hovering) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: _hovering ? 220 : 460,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            // Left side (verde)
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _hovering ? 220 : 130,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFF5DE2A3),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Cartão
                  AnimatedBuilder(
                    animation: _cardSlide,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _cardSlide.value),
                        child: Transform.rotate(
                          angle: _cardSlide.value != 0 ? 1.57 : 0, // ~90°
                          child: child,
                        ),
                      );
                    },
                    child: Container(
                      width: 70,
                      height: 46,
                      decoration: BoxDecoration(
                        color: const Color(0xFFC7FFBC),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(77, 200, 143, 0.72),
                            blurRadius: 9,
                            offset: const Offset(4, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 7),
                            width: 65,
                            height: 13,
                            decoration: BoxDecoration(
                              color: const Color(0xFF80EA69),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5, left: 10),
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFF379E1F),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF26850E),
                                  offset: Offset(0, -10),
                                ),
                                BoxShadow(
                                  color: Color(0xFF56BE3E),
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Caixa de post
                  AnimatedBuilder(
                    animation: _postSlide,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _postSlide.value),
                        child: child,
                      );
                    },
                    child: Positioned(
                      bottom: 10,
                      child: Container(
                        width: 63,
                        height: 75,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDDDEE0),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Stack(
                          children: [
                            // Linha do topo
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Column(
                                children: [
                                  Container(
                                    width: 47,
                                    height: 9,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF545354),
                                      borderRadius: const BorderRadius.vertical(
                                        bottom: Radius.circular(3),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 47,
                                    height: 9,
                                    color: const Color(0xFF757375),
                                  ),
                                ],
                              ),
                            ),
                            // Tela
                            Positioned(
                              top: 22,
                              right: 8,
                              child: Container(
                                width: 47,
                                height: 23,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                alignment: Alignment.center,
                                child: AnimatedOpacity(
                                  opacity: _hovering ? 1 : 0,
                                  duration: const Duration(milliseconds: 300),
                                  child: const Text(
                                    "\$",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4B953B),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Numbers
                            Positioned(
                              left: 25,
                              top: 52,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF838183),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 25,
                              top: 68,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFAAA9AB),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Right side
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: _hovering ? const Color(0xFFF9F7F9) : Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "New Transaction",
                        style: TextStyle(
                          fontSize: 23,
                          fontFamily: "Lexend Deca",
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Color(0xFFCFCFCF),
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
