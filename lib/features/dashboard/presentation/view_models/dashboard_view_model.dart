
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:girimote/features/dashboard/data/models/widget_model.dart';

class DashboardViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<DashboardWidgetModel> _widgets = [];
  List<DashboardWidgetModel> get widgets => _widgets;

  bool _isEditMode = false;
  bool get isEditMode => _isEditMode;

  DashboardViewModel() {
    _loadWidgets();
  }

  void toggleEditMode() {
    _isEditMode = !_isEditMode;
    notifyListeners();
  }

  Future<void> _loadWidgets() async {
    User? user = _auth.currentUser;
    if (user != null) {
      final snapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('widgets')
          .get();
      _widgets = snapshot.docs
          .map((doc) => DashboardWidgetModel.fromJson(doc.data()))
          .toList();
      notifyListeners();
    }
  }

  Future<void> addWidget(WidgetType type) async {
    User? user = _auth.currentUser;
    if (user != null) {
      final newWidget = DashboardWidgetModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        type: type,
        title: 'New Widget',
        x: 0,
        y: 0,
        width: 1,
        height: 1,
      );
      _widgets.add(newWidget);
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('widgets')
          .doc(newWidget.id)
          .set(newWidget.toJson());
      notifyListeners();
    }
  }

  Future<void> updateWidget(DashboardWidgetModel widget) async {
    User? user = _auth.currentUser;
    if (user != null) {
      final index = _widgets.indexWhere((w) => w.id == widget.id);
      if (index != -1) {
        _widgets[index] = widget;
        await _firestore
            .collection('users')
            .doc(user.uid)
            .collection('widgets')
            .doc(widget.id)
            .update(widget.toJson());
        notifyListeners();
      }
    }
  }

  Future<void> deleteWidget(String id) async {
    User? user = _auth.currentUser;
    if (user != null) {
      _widgets.removeWhere((w) => w.id == id);
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('widgets')
          .doc(id)
          .delete();
      notifyListeners();
    }
  }
}
