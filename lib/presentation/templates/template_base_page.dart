import 'package:flutter/material.dart';
import '../organisms/organism.dart';
import '../atoms/atoms.dart';

enum _BodyType { list, custom, descriptive }

/// Template base reutilizable para cualquier página con header, body y footer.
/// Permite pasar widgets personalizados o construir una lista de cards si se pasan los parámetros de lista.
class TemplateBasePage extends StatefulWidget {
  final Widget header;
  final Widget footer;

  // Parámetros para lista de cards (opcional)
  final List<String>? imageUrls;
  final List<String>? descriptions;
  final List<VoidCallback?>? onSeeMoreCallbacks;

  // Parámetros para body descriptivo (opcional)
  final String? descriptiveTitle;
  final String? descriptiveSubtitle;
  final String? descriptiveImageUrl;
  final String? descriptiveTextFieldHint;
  final String? descriptiveButtonText;
  final bool descriptiveButtonDependsOnText;

  //Parametros para body personalizado (opcional)
  final Widget? body;

  final void Function(String text)? descriptiveOnButtonPressed;

  /// Si se pasan los 3 parámetros de lista, el body se construye como lista de cards.
  /// Si las listas están vacías, se muestra el body descriptivo.
  /// Si no, se usa el widget [body] proporcionado.

  const TemplateBasePage({
    super.key,
    required this.header,
    required this.footer,
    // Body personalizado
    this.body,
    // Body con lista de elementos
    this.imageUrls,
    this.descriptions,
    this.onSeeMoreCallbacks,
    // Body descriptivo
    this.descriptiveTitle,
    this.descriptiveSubtitle,
    this.descriptiveImageUrl,
    this.descriptiveTextFieldHint,
    this.descriptiveButtonText,
    this.descriptiveButtonDependsOnText = false,
    this.descriptiveOnButtonPressed,
  }) : assert(
         (imageUrls == null &&
                 descriptions == null &&
                 onSeeMoreCallbacks == null) ||
             (imageUrls != null &&
                 descriptions != null &&
                 onSeeMoreCallbacks != null &&
                 imageUrls.length == descriptions.length &&
                 descriptions.length == onSeeMoreCallbacks.length),
         'Si se usa la lista, los 3 parámetros deben estar presentes y tener el mismo tamaño.',
       ),
       assert(
         body != null ||
             (imageUrls != null &&
                 descriptions != null &&
                 onSeeMoreCallbacks != null) ||
             descriptiveTitle != null ||
             descriptiveSubtitle != null ||
             descriptiveImageUrl != null ||
             descriptiveTextFieldHint != null ||
             descriptiveButtonText != null ||
             descriptiveOnButtonPressed != null,
         'Debes proporcionar al menos un body, parámetros de lista o parámetros descriptivos.',
       );

  @override
  State<TemplateBasePage> createState() => _TemplateBasePageState();
}

class _TemplateBasePageState extends State<TemplateBasePage> {
  late final TextEditingController _descTextController;

  @override
  void initState() {
    super.initState();
    _descTextController = TextEditingController();
  }

  @override
  void dispose() {
    _descTextController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    // Validación de exclusividad de parámetros
    _validateExclusiveParams();
    return Scaffold(
      body: Column(
        children: [
          widget.header,
          Expanded(child: _buildBodyContent()),
          widget.footer,
        ],
      ),
    );
  }

  /// Valida que no se mezclen parámetros de lista y descriptivos a la vez.
  void _validateExclusiveParams() {
    final bool hasList = _hasListParams();
    final bool hasDescriptive = _hasDescriptiveParams();
    if (hasList && hasDescriptive) {
      throw ArgumentError(
        'No se pueden enviar parámetros de lista y de body descriptivo al mismo tiempo.',
      );
    }
  }

  /// Retorna true si hay parámetros de lista con elementos.
  bool _hasListParams() {
    return (widget.imageUrls != null && widget.imageUrls!.isNotEmpty) ||
        (widget.descriptions != null && widget.descriptions!.isNotEmpty) ||
        (widget.onSeeMoreCallbacks != null &&
            widget.onSeeMoreCallbacks!.isNotEmpty);
  }

  /// Retorna true si hay algún parámetro descriptivo presente.
  bool _hasDescriptiveParams() {
    return widget.descriptiveTitle != null ||
        widget.descriptiveSubtitle != null ||
        widget.descriptiveImageUrl != null ||
        widget.descriptiveTextFieldHint != null ||
        widget.descriptiveButtonText != null ||
        widget.descriptiveOnButtonPressed != null;
  }

  /// Construye el body adecuado según los parámetros recibidos usando un switch para mayor claridad.
  Widget _buildBodyContent() {
    final _BodyType type = _getBodyType();
    switch (type) {
      case _BodyType.list:
        return ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: widget.imageUrls!.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: OrganismListCard(
              imageUrls: [widget.imageUrls![index]],
              descriptions: [widget.descriptions![index]],
              onSeeMoreCallbacks: [widget.onSeeMoreCallbacks![index]],
            ),
          ),
        );
      case _BodyType.custom:
        return widget.body!;
      case _BodyType.descriptive:
        return _buildDescriptiveBody();
    }
  }

  /// Determina el tipo de body a mostrar según los parámetros recibidos.
  _BodyType _getBodyType() {
    final bool isListParams =
        widget.imageUrls != null &&
        widget.descriptions != null &&
        widget.onSeeMoreCallbacks != null &&
        widget.imageUrls!.isNotEmpty;
    if (isListParams) {
      return _BodyType.list;
    } else if (widget.body != null) {
      return _BodyType.custom;
    } else {
      return _BodyType.descriptive;
    }
  }

  Widget _buildDescriptiveBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.descriptiveTitle != null)
            AtomText(
              text: widget.descriptiveTitle!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          if (widget.descriptiveSubtitle != null) ...[
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: AtomLabel(
                text: widget.descriptiveSubtitle!,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
          ],
          if (widget.descriptiveImageUrl != null) ...[
            const SizedBox(height: 24),
            AtomImg(
              imageUrl: widget.descriptiveImageUrl!,
              height: 160,
              fit: BoxFit.contain,
            ),
          ],
          const SizedBox(height: 24),
          TextField(
            controller: _descTextController,
            decoration: InputDecoration(
              hintText: widget.descriptiveTextFieldHint ?? 'Escribe aquí...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: AtomButton(
              label: widget.descriptiveButtonText ?? 'Aceptar',
              onPressed: (widget.descriptiveOnButtonPressed == null)
                  ? null
                  : (widget.descriptiveButtonDependsOnText
                        ? (_descTextController.text.trim().isEmpty
                              ? null
                              : () => widget.descriptiveOnButtonPressed!(
                                  _descTextController.text,
                                ))
                        : () => widget.descriptiveOnButtonPressed!(
                            _descTextController.text,
                          )),
            ),
          ),
        ],
      ),
    );
  }
}
