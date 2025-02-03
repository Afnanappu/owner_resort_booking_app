import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/data/view_model/cubit/owner_data_cubit.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/components/app_bar_for_dashboard.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/components/custom_widget_for_dashboard.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/widgets/booking_rate_line_chart.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/widgets/custom_grid_tile.dart';
import 'package:owner_resort_booking_app/features/dashboard/view/widgets/total_booking_container_widget.dart';
import 'package:owner_resort_booking_app/features/dashboard/view_model/bloc/bloc_dashboard/dashboard_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_list/my_property_list_bloc.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class ScreenDashboard extends StatelessWidget {
  const ScreenDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<OwnerDataCubit>().fetchOwnerData().then(
          (_) {
            final ownerId = context.read<OwnerDataCubit>().state?.uid;
            if (ownerId == null) {
              log('Owner ID is null, cannot fetch dashboard details.');
              return;
            }
            context
                .read<DashboardBloc>()
                .add(DashboardEvent.fetchDashboardDetails(ownerId: ownerId));
          },
        );

        // final ownerId = context.read<OwnerDataCubit>().state?.uid;
        // if (ownerId == null) {
        //   log('Owner ID is null, cannot fetch dashboard details.');
        //   return;
        // }
        // context
        //     .read<DashboardBloc>()
        //     .add(DashboardEvent.fetchDashboardDetails(ownerId: ownerId));
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
                onTap: () {},
              ),
              CustomGridTile(
                image: 'assets/icons/report.png',
                title: "Revenue &\nReport",
                onTap: () {},
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
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                orElse: () {
                  return const Center(
                    child: Text('An unexpected error occurred.'),
                  );
                },
                loaded: (dashboardModel) {
                  final totalBookings = dashboardModel.totalBookingModel;
                  final summary = dashboardModel.summaryModel;
                  final bookingRateData = dashboardModel.bookingRateModel;
                  return Column(
                    children: [
                      //total booking
                      CustomWidgetForHome(
                        title: 'Total Booking',
                        child: TotalBookingContainerWidget(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Upcoming'),
                                Text('${totalBookings.upcomingBookings}'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Completed'),
                                Text('${totalBookings.completedBookings}'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Cancelled'),
                                Text('${totalBookings.cancelledBookings}'),
                              ],
                            ),
                          ],
                        ),
                      ),

                      BookingRateLineChart(
                        bookingRateData: bookingRateData,
                      ),

                      //summary
                      CustomWidgetForHome(
                        title: 'Summary',
                        child: TotalBookingContainerWidget(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Visitors'),
                                Text('${summary?.totalVisitors}'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total rooms'),
                                Text('${summary?.roomCount}'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Properties'),
                                Text('${summary?.propertyCount}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
              // return Column(
              //   children: [
              //     //total booking
              //     CustomWidgetForHome(
              //       title: 'Total Booking',
              //       child: TotalBookingContainerWidget(
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text('Upcoming'),
              //               Text('10'),
              //             ],
              //           ),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text('Completed'),
              //               Text('8'),
              //             ],
              //           ),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text('Cancelled'),
              //               Text('1'),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),

              //     BookingRateLineChart(
              //         // bookingData: [
              //         //   BookingModel(bookedDate: DateTime(2025, 1, 1), count: 5),
              //         //   BookingModel(bookedDate: DateTime(2025, 1, 2), count: 8),
              //         //   BookingModel(bookedDate: DateTime(2025, 1, 3), count: 10),
              //         //   BookingModel(bookedDate: DateTime(2025, 1, 4), count: 6),
              //         //   BookingModel(bookedDate: DateTime(2025, 1, 10), count: 12),
              //         //   BookingModel(bookedDate: DateTime(2025, 1, 15), count: 7),
              //         //   BookingModel(bookedDate: DateTime(2025, 1, 20), count: 4),
              //         //   BookingModel(bookedDate: DateTime(2025, 1, 5), count: 9),
              //         // ],
              //         ),

              //     //summary
              //     CustomWidgetForHome(
              //       title: 'Summary',
              //       child: TotalBookingContainerWidget(
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text('Visitors'),
              //               Text('100'),
              //             ],
              //           ),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text('Total rooms'),
              //               Text('28'),
              //             ],
              //           ),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text('Total Properties'),
              //               Text('8'),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),

              //     //log out button
              //     Padding(
              //       padding: const EdgeInsets.all(20),
              //       child: ElevatedButton(
              //         onPressed: () async {
              //           context
              //               .read<NotificationBloc>()
              //               .add(NotificationEvent.sendNotification(
              //                 uid: 'j35DaR0PS4ePgpOKdxkWpJXavYi2',
              //                 title: "✅ New Booking Received",
              //                 content:
              //                     "📍 AFNAAN P has booked Ganga Resort from 10/01/25 to 16/01/25.",
              //               ));
              //           // await FirebaseAuth.instance.signOut();
              //           // // ignore: use_build_context_synchronously
              //           // context.go('/${AppRoutes.login}');
              //         },
              //         child: Text('Log out'),
              //       ),
              //     ),
              //   ],
              // );
            },
          ),
        ],
      ),
    );
  }
}
