// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/data/view_model/cubit/owner_data_cubit.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/components/app_bar_for_dashboard.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/widgets/custom_grid_tile.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/widgets/summary_widget.dart';
import 'package:owner_resort_booking_app/features/dashboard/view_model/bloc/bloc_dashboard/dashboard_bloc.dart';
import 'package:owner_resort_booking_app/features/dashboard/view_model/bloc/bloc_revenue_and_report/revenue_and_report_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_list/my_property_list_bloc.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class ScreenDashboard extends StatelessWidget {
  const ScreenDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<OwnerDataCubit>().fetchOwnerData().then(
          (_) {
            final ownerId = context.read<OwnerDataCubit>().state?.uid;
            if (ownerId == null) {
              log('Owner ID is null, cannot fetch dashboard details.');
              context.go('/${AppRoutes.login}');
              return;
            }
            context.read<OwnerDataCubit>().isOwnerBlocked(context);
            context
                .read<DashboardBloc>()
                .add(DashboardEvent.fetchDashboardDetails(ownerId: ownerId));
          },
        );
      },
    );
    return Scaffold(
      appBar: AppBarForDashboard(),
      body: ListView(
        shrinkWrap: true,
        children: [
          MySpaces.hSpace40,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomGridTile(
                image: 'assets/icons/house.png',
                title: "My\nProperties",
                onTap: () {
                  context.push('/${AppRoutes.myProperties}');
                  final uid = FirebaseAuth.instance.currentUser!.uid;
                  context
                      .read<MyPropertyListBloc>()
                      .add(MyPropertyListEvent.fetchProperties(uid: uid));
                },
              ),
              CustomGridTile(
                image: 'assets/icons/group.png',
                title: "My\nCustomers",
                onTap: () {
                  context.push('/${AppRoutes.myCustomers}');
                },
              ),
              CustomGridTile(
                image: 'assets/icons/report.png',
                title: "Revenue &\nReport",
                onTap: () {
                  context.read<RevenueAndReportBloc>().add(RevenueAndReportEvent.fetchRevenueData());
                  context.push('/${AppRoutes.revenueAndReport}');
                },
                innerPadding: 15,
              ),
            ],
          ),
          MySpaces.hSpace40,

          //Report and summary
          BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              return state.maybeWhen(
                error: (error) => const Center(
                  child: Text('Error loading data. Please try again later.'),
                ),
                loading: () => SummaryWidgetShimmer(),
                orElse: () {
                  return const Center(
                    child: Text('An unexpected error occurred.'),
                  );
                },
                loaded: (dashboardModel) {
                  final totalBookings = dashboardModel.totalBookingModel;
                  final summary = dashboardModel.summaryModel;
                  final bookingRateData = dashboardModel.bookingRateModel;
                  return SummaryWidget(
                    totalBookings: totalBookings,
                    bookingRateData: bookingRateData,
                    summary: summary,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
