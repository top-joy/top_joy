import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_joy/core/utils/app_text_style.dart';
import 'package:top_joy/presentation/free_time/bloc/free_times_cubit.dart';
import '../../../data/free_time/models/free_time_model.dart';
import '../widgets/free_time_box.dart';

@RoutePage()
class FreeTimesPage extends StatefulWidget {
  final String serviceId;

  const FreeTimesPage({
    super.key,
    required this.serviceId,
  });

  @override
  State<FreeTimesPage> createState() => _FreeTimesPageState();
}

class _FreeTimesPageState extends State<FreeTimesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late DateTime _selectedDate;
  FreeTime? _selectedFreeTime; // Tanlangan vaqtni saqlash

  List<DateTime> _days = [];

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _tabController = TabController(length: 7, vsync: this);

    _days =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchFreeTimesForDate(_selectedDate);
    });
  }

  void _fetchFreeTimesForDate(DateTime date) {
    context.read<FreeTimesCubit>().fetchFreeTimes(widget.serviceId, date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sana va vaqtni tanlang',
          style: AppTextStyle.montserratBold.copyWith(fontSize: 18),
        ),
        forceMaterialTransparency: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: TabBar(
            tabAlignment: TabAlignment.start,
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.blue,
            onTap: (index) {
              setState(() {
                _selectedDate = _days[index];
                _fetchFreeTimesForDate(_selectedDate);
              });
            },
            tabs: _days.map((date) {
              return Tab(
                text: '${date.day} ${_getDayOfWeekUzbek(date.weekday)}',
              );
            }).toList(),
          ),
        ),
      ),
      body: BlocBuilder<FreeTimesCubit, FreeTimesState>(
        builder: (context, state) {
          if (state is FreeTimesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FreeTimesLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 16 / 5,
              ),
              padding: const EdgeInsets.all(16),
              itemCount: state.freeTimes.length,
              itemBuilder: (context, index) {
                final freeTime = state.freeTimes[index];
                return FreeTimeBox(
                  freeTime: freeTime,
                  isSelected: _selectedFreeTime == freeTime,
                  onTap: (selectedFreeTime) {
                    setState(() {
                      _selectedFreeTime = selectedFreeTime;
                    });
                  },
                );
              },
            );
          } else if (state is FreeTimesError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            if (_selectedFreeTime != null) {
              // Tasdiqlash amallari
              print('$_selectedFreeTime');
            }
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            'Tasdiqlang',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  String _getDayOfWeekUzbek(int weekday) {
    const daysInUzbek = ['Yak', 'Dush', 'Sesh', 'Chor', 'Pay', 'Jum', 'Shan'];
    return daysInUzbek[weekday - 1];
  }
}
