import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  // Helper method to get FPO status based on score
  String _getFPOStatus(double score) {
    if (score > 70) return 'Archiver';
    if (score >= 50) return 'Performer';
    return 'Aspirational';
  }

  // Helper method to get color based on score
  Color _getScoreColor(double score) {
    if (score > 70) return Colors.green;
    if (score >= 50) return Colors.blue;
    return Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Analytics & Reports',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'FPO Assessment Overview',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Chip(
                          label: const Text('Current Status'),
                          backgroundColor: Theme.of(
                            context,
                          ).primaryColor.withOpacity(0.1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildReportItem(
                      'Governance & Management',
                      '65',
                      Icons.business,
                      _getScoreColor(65),
                    ),
                    const Divider(),
                    _buildReportItem(
                      'Business & Operations',
                      '58',
                      Icons.store,
                      _getScoreColor(58),
                    ),
                    const Divider(),
                    _buildReportItem(
                      'Process & Systems',
                      '72',
                      Icons.settings,
                      _getScoreColor(72),
                    ),
                    const Divider(),
                    _buildReportItem(
                      'Financial Performance',
                      '48',
                      Icons.attach_money,
                      _getScoreColor(48),
                    ),
                    const Divider(),
                    _buildReportItem(
                      'Compliance',
                      '75',
                      Icons.verified_user,
                      _getScoreColor(75),
                    ),
                    const SizedBox(height: 16),
                    _buildStatusSummary(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Assessment Status',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overall Assessment',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('t:', style: TextStyle(fontSize: 16)),
                        Chip(
                          label: Text(
                            '61',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: _getScoreColor(61).withOpacity(0.1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Status:', style: TextStyle(fontSize: 16)),
                        Chip(
                          label: Text(
                            _getFPOStatus(61),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: _getScoreColor(61),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('FPO Size:', style: TextStyle(fontSize: 16)),
                        Text(
                          'B13',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Recent FPO Reports',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  _buildReportListItem(
                    context,
                    'FPO Governance Assessment',
                    'Governance & Management Report',
                    Icons.business,
                  ),
                  _buildReportListItem(
                    context,
                    'Business Operations Analysis',
                    'Business & Operations Report',
                    Icons.store,
                  ),
                  _buildReportListItem(
                    context,
                    'Process Systems Review',
                    'Process & Systems Report',
                    Icons.settings,
                  ),
                  _buildReportListItem(
                    context,
                    'Financial Performance Report',
                    'Financial Performance Analysis',
                    Icons.attach_money,
                  ),
                  _buildReportListItem(
                    context,
                    'Compliance Review',
                    'Compliance Assessment Report',
                    Icons.verified_user,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Generate Report'),
        icon: const Icon(Icons.add_chart),
      ),
    );
  }

  Widget _buildReportItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    double score = double.tryParse(value) ?? 0;
    String status = _getFPOStatus(score);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Row(
                  children: [
                    Text(
                      '$value',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Chip(
                      label: Text(
                        status,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: color,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Status Legend:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildStatusIndicator('Archiver (>70)', Colors.green),
            const SizedBox(width: 12),
            _buildStatusIndicator('Performer (50-70)', Colors.blue),
            const SizedBox(width: 12),
            _buildStatusIndicator('Aspirational (<50)', Colors.orange),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusIndicator(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildReportListItem(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: IconButton(
          icon: const Icon(Icons.download),
          onPressed: () {},
        ),
      ),
    );
  }
}
