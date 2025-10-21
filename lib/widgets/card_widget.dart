import 'package:flutter/material.dart';
import 'package:my_fit_ui_kit/utils/ui_color.dart';
import 'package:my_fit_ui_kit/utils/text_style.dart';
import 'package:my_fit_ui_kit/models/card_type.dart';
import 'package:my_fit_ui_kit/models/exercise_type.dart';

class UiCard {
  Widget simpleCard({
    double space = 0.02,
    required String title,
    required String image,
    double imageSize = 130,
    required Function() onTap,
    required String description,
    TextStyle? descriptionStyle,
    CartType cartType = CartType.gray,
    ExerciseType exerciseType = ExerciseType.general,
  }) =>
      _CardWidget(
        title: title,
        image: image,
        space: space,
        onTap: onTap,
        cartType: cartType,
        imageSize: imageSize,
        description: description,
        descriptionStyle: descriptionStyle,
        exerciseType: exerciseType,
      );

  Widget detailCard({
    TextStyle? style,
    required String label,
    required String value,
  }) =>
      _DetailCard(label: label, value: value, style: style);

  Widget productCard({
    required String label,
    required Function() onTap,
    required String firstValue,
    required String secondValue,
  }) =>
      _ProductCard(
        onTap: onTap,
        label: label,
        firstValue: firstValue,
        secondValue: secondValue,
      );
}

class _CardWidget extends StatelessWidget {
  final String title;
  final String image;
  final double space;
  final double imageSize;
  final Function() onTap;
  final CartType cartType;
  final String description;
  final TextStyle? descriptionStyle;
  final ExerciseType exerciseType;

  const _CardWidget({
    required this.space,
    required this.onTap,
    required this.title,
    required this.image,
    this.descriptionStyle,
    required this.cartType,
    required this.imageSize,
    required this.description,
    required this.exerciseType,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Container(
      height: screenHeight * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: cartType == CartType.green
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  UiColor().primary,
                  UiColor().primary.withOpacity(0.8),
                  UiColor().primary.withOpacity(0.6),
                ],
              )
            : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  UiColor().card,
                  UiColor().card.withOpacity(0.9),
                  UiColor().cardDark,
                ],
              ),
        boxShadow: [
          BoxShadow(
            color: cartType == CartType.green
                ? UiColor().primary.withOpacity(0.3)
                : Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: onTap,
          splashColor: cartType == CartType.green
              ? UiColor().backgroundButton.withOpacity(0.1)
              : UiColor().primary.withOpacity(0.1),
          highlightColor: cartType == CartType.green
              ? UiColor().backgroundButton.withOpacity(0.05)
              : UiColor().primary.withOpacity(0.05),
          child: Stack(
            children: [
              // Patrones decorativos de fondo
              Positioned(
                top: -40,
                right: 80,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: cartType == CartType.green
                        ? UiColor().backgroundButton.withOpacity(0.1)
                        : UiColor().primary.withOpacity(0.1),
                  ),
                ),
              ),
              Positioned(
                bottom: -20,
                right: -10,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: cartType == CartType.green
                        ? UiColor().backgroundButton.withOpacity(0.05)
                        : UiColor().primary.withOpacity(0.05),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 160,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: cartType == CartType.green
                        ? UiColor().backgroundButton.withOpacity(0.08)
                        : UiColor().primary.withOpacity(0.08),
                  ),
                ),
              ),
              // Elemento visual principal (icono o forma)
              Positioned(
                right: 16,
                top: 16,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        _getIconColor().withOpacity(0.15),
                        _getIconColor().withOpacity(0.05),
                        _getIconColor().withOpacity(0.0),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _getIconColor().withOpacity(0.4),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: _getIconColor().withOpacity(0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: _getIconColor().withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _getIconForExercise(),
                        size: 30,
                        color: _getIconColor(),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _getExerciseLabel(),
                        style: FitTextStyle().text.copyWith(
                          color: _getIconColor(),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              // Contenido principal
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.035),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título
                    Expanded(
                      flex: 2,
                      child: Text(
                        title,
                        style: FitTextStyle().title.copyWith(
                          color: cartType == CartType.green
                              ? UiColor().backgroundButton
                              : UiColor().textColor,
                          height: 1.1,
                          shadows: [
                            Shadow(
                              blurRadius: 8.0,
                              offset: const Offset(0, 2),
                              color: cartType == CartType.green
                                  ? Colors.black.withOpacity(0.3)
                                  : Colors.black.withOpacity(0.2),
                            ),
                          ],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Espaciado dinámico
                    SizedBox(height: screenHeight * space),
                    // Descripción
                    Expanded(
                      flex: 3,
                      child: Text(
                        description,
                        style: descriptionStyle ??
                            FitTextStyle().description.copyWith(
                              color: cartType == CartType.green
                                  ? UiColor().backgroundButton.withOpacity(0.9)
                                  : UiColor().textColor.withOpacity(0.8),
                              height: 1.4,
                              shadows: [
                                Shadow(
                                  blurRadius: 4.0,
                                  offset: const Offset(0, 1),
                                  color: cartType == CartType.green
                                      ? Colors.black.withOpacity(0.2)
                                      : Colors.black.withOpacity(0.1),
                                ),
                              ],
                            ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconForExercise() {
    switch (exerciseType) {
      case ExerciseType.legs:
        return Icons.directions_run; // Correr/ejercicios de piernas
      case ExerciseType.arms:
        return Icons.fitness_center; // Pesas/ejercicios de brazos
      case ExerciseType.fullBody:
        return Icons.accessibility_new; // Cuerpo completo
      case ExerciseType.abdomen:
        return Icons.self_improvement; // Core/abdomen
      case ExerciseType.cardio:
        return Icons.favorite; // Cardio/corazón
      case ExerciseType.flexibility:
        return Icons.self_improvement; // Flexibilidad/yoga
      case ExerciseType.strength:
        return Icons.sports_gymnastics; // Fuerza/gimnasia
      case ExerciseType.balance:
        return Icons.balance; // Equilibrio
      case ExerciseType.general:
        return Icons.sports; // General
    }
  }

  Color _getIconColor() {
    switch (exerciseType) {
      case ExerciseType.legs:
        return UiColor().orange; // Naranja para piernas
      case ExerciseType.arms:
        return UiColor().primary; // Verde para brazos
      case ExerciseType.fullBody:
        return Colors.blue; // Azul para cuerpo completo
      case ExerciseType.abdomen:
        return Colors.purple; // Púrpura para abdomen
      case ExerciseType.cardio:
        return Colors.red; // Rojo para cardio
      case ExerciseType.flexibility:
        return Colors.teal; // Verde azulado para flexibilidad
      case ExerciseType.strength:
        return Colors.amber; // Ámbar para fuerza
      case ExerciseType.balance:
        return Colors.indigo; // Índigo para equilibrio
      case ExerciseType.general:
        return cartType == CartType.green 
            ? UiColor().backgroundButton 
            : UiColor().primary;
    }
  }

  String _getExerciseLabel() {
    return exerciseType.displayName;
  }
}

class _DetailCard extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? style;

  const _DetailCard({required this.value, required this.label, this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            UiColor().card,
            UiColor().card.withOpacity(0.9),
            UiColor().cardDark,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: UiColor().primary.withOpacity(0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: UiColor().primary.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: (style ?? FitTextStyle().title).copyWith(
                color: UiColor().textColor.withOpacity(0.9),
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: UiColor().primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: UiColor().primary.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Text(
                value,
                style: (style ?? FitTextStyle().title).copyWith(
                  color: UiColor().primary,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String label;
  final Function() onTap;
  final String firstValue;
  final String secondValue;

  const _ProductCard({
    required this.label,
    required this.onTap,
    required this.firstValue,
    required this.secondValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            UiColor().card,
            UiColor().card.withOpacity(0.9),
            UiColor().cardDark,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: UiColor().primary.withOpacity(0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: UiColor().primary.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          splashColor: UiColor().primary.withOpacity(0.1),
          highlightColor: UiColor().primary.withOpacity(0.05),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    label,
                    style: FitTextStyle().titleXL.copyWith(
                      color: UiColor().textColor,
                      height: 1.1,
                      shadows: [
                        Shadow(
                          blurRadius: 4.0,
                          offset: const Offset(0, 2),
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: UiColor().primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: UiColor().primary.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          firstValue,
                          style: FitTextStyle().text.copyWith(
                            color: UiColor().primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: UiColor().orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: UiColor().orange.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          secondValue,
                          style: FitTextStyle().text.copyWith(
                            color: UiColor().orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
