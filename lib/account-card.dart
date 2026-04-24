import 'package:flutter/material.dart';

class AccountCard extends StatefulWidget {
  final String site;
  final String email;
  final String password;
  final IconData icon;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const AccountCard({
    super.key,
    required this.site,
    required this.email,
    required this.password,
    required this.icon,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  State<AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: widget.onEdit,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(widget.icon, size: 40, color: Color(0xFF01132B)),
              const SizedBox(width: 18),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.site,
                      style: const TextStyle(
                        fontFamily: 'Machille',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.email,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isVisible ? widget.password : '••••••••',
                      style: const TextStyle(letterSpacing: 2),
                    ),
                  ],
                ),
              ),

              IconButton(
                icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => isVisible = !isVisible),
              ),

              IconButton(
                icon: const Icon(Icons.delete, size: 28, color: Colors.red),
                onPressed: widget.onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
