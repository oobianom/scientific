<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    <title>GlobalView Time & Attendance for Employees – USPR</title>
    <style>

	:root {
  --sidebarmaincol: #dc3545;
  --sidebarmaincolfade: #dc354522;
  --hoversidefade1: rgba(0,0,0,0.1);
  --sidebarprimcol: #ffffff;
}
        .sidebar {
            background-color: var(--sidebarmaincol);
            min-height: 100vh;
            color: var(--sidebarprimcol);
        }
        .progress-badge {
            background-color: var(--hoversidefade1);
        }
        .nav-link {
            color: #333333;
            padding: 0.75rem 1rem;
            cursor: pointer;
        }
        .nav-link:hover {
            background-color: var(--hoversidefade1);
            color: #000000;
        }
        .nav-link.active {
            background-color: var(--hoversidefade1);
        }
        .check-icon {
            width: 20px;
            height: 20px;
            margin-right: 8px;
        }
        .dropdown-toggle::after {
            float: right;
            margin-top: 8px;
        }
        .sub-menu {
            background-color: var(--hoversidefade1);
            padding-left: 2rem;
        }
        .sub-menu .nav-link {
            font-size: 0.9rem;
            padding: 0.5rem 1rem;
        }
        .chevron-icon {
            width: 16px;
            height: 16px;
            margin-right: 8px;
            transition: transform 0.3s;
        }
        .collapsed .chevron-icon {
            transform: rotate(-45deg);
        }
		.navsideleft{
		background-color: #ffffff;
		}
		.navsideleft .nav{
		background-color: var(--sidebarmaincolfade);
		}
		.align-left-icon {
            width: 20px;
            height: 20px;
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 px-0 sidebar">
                <div class="p-3">
                    <h5 class="fw-bold mb-4">GlobalView Time & Attendance for Employees – USPR</h5>

                </div>

                <nav class="mt-4 navsideleft">
                    <div class="nav flex-column">
                        <!-- Introduction -->
                        <a class="nav-link d-flex align-items-center justify-content-between collapsed" data-bs-toggle="collapse" data-bs-target="#intro-collapse">
                            <span class="d-flex align-items-center">
                                <svg class="align-left-icon" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M2 12.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z"/>
                                </svg>
                                Introduction
                            </span>
                            <svg class="chevron-icon" viewBox="0 0 16 16" fill="currentColor">
                                <path d="M8 0l8 8-8 8-1.4-1.4L13.2 8 6.6 1.4z"/>
                            </svg>
                        </a>
                        <div class="collapse sub-menu" id="intro-collapse">
                            <a class="nav-link">Overview</a>
                            <a class="nav-link">Getting Started</a>
                            <a class="nav-link">System Requirements</a>
                        </div>

                        <!-- Accessing ADP -->
                        <a class="nav-link d-flex align-items-center justify-content-between collapsed" data-bs-toggle="collapse" data-bs-target="#access-collapse">
                            <span class="d-flex align-items-center">
                                <svg class="check-icon" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                                </svg>
                                Accessing ADP Global myView
                            </span>
                            <svg class="chevron-icon" viewBox="0 0 16 16" fill="currentColor">
                                <path d="M8 0l8 8-8 8-1.4-1.4L13.2 8 6.6 1.4z"/>
                            </svg>
                        </a>
                        <div class="collapse sub-menu" id="access-collapse">
                            <a class="nav-link">Login Process</a>
                            <a class="nav-link">Security Settings</a>
                            <a class="nav-link">Password Reset</a>
                        </div>

                        <!-- Schedule -->
                        <a class="nav-link d-flex align-items-center justify-content-between collapsed" data-bs-toggle="collapse" data-bs-target="#schedule-collapse">
                            <span class="d-flex align-items-center">
                                <svg class="check-icon" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                                </svg>
                                Viewing Your Schedule
                            </span>
                            <svg class="chevron-icon" viewBox="0 0 16 16" fill="currentColor">
                                <path d="M8 0l8 8-8 8-1.4-1.4L13.2 8 6.6 1.4z"/>
                            </svg>
                        </a>
                        <div class="collapse sub-menu" id="schedule-collapse">
                            <a class="nav-link">Calendar View</a>
                            <a class="nav-link">Weekly Schedule</a>
                            <a class="nav-link">Time Blocks</a>
                        </div>

                        <!-- Web Portal Requests -->
                        <a class="nav-link d-flex align-items-center justify-content-between collapsed" data-bs-toggle="collapse" data-bs-target="#web-collapse">
                            <span class="d-flex align-items-center">
                                <svg class="check-icon" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                                </svg>
                                Web Portal Requests
                            </span>
                            <svg class="chevron-icon" viewBox="0 0 16 16" fill="currentColor">
                                <path d="M8 0l8 8-8 8-1.4-1.4L13.2 8 6.6 1.4z"/>
                            </svg>
                        </a>
                        <div class="collapse sub-menu" id="web-collapse">
                            <a class="nav-link">Submit Request</a>
                            <a class="nav-link">View Status</a>
                            <a class="nav-link">Cancel Request</a>
                        </div>

                        <!-- Mobile App Requests -->
                        <a class="nav-link active d-flex align-items-center justify-content-between" data-bs-toggle="collapse" data-bs-target="#mobile-collapse">
                            <span>Mobile App Requests</span>
                            <svg class="chevron-icon" viewBox="0 0 16 16" fill="currentColor">
                                <path d="M8 0l8 8-8 8-1.4-1.4L13.2 8 6.6 1.4z"/>
                            </svg>
                        </a>
                        <div class="collapse show sub-menu" id="mobile-collapse">
                            <a class="nav-link">Install App</a>
                            <a class="nav-link">Submit Request</a>
                            <a class="nav-link">View Status</a>
                        </div>

                        <!-- Time Statement -->
                        <a class="nav-link d-flex align-items-center justify-content-between collapsed" data-bs-toggle="collapse" data-bs-target="#time-collapse">
                            <span>Time Statement</span>
                            <svg class="chevron-icon" viewBox="0 0 16 16" fill="currentColor">
                                <path d="M8 0l8 8-8 8-1.4-1.4L13.2 8 6.6 1.4z"/>
                            </svg>
                        </a>
                        <div class="collapse sub-menu" id="time-collapse">
                            <a class="nav-link">View Statement</a>
                            <a class="nav-link">Download PDF</a>
                            <a class="nav-link">Print Statement</a>
                        </div>

                        <!-- Understanding -->
                        <a class="nav-link d-flex align-items-center justify-content-between collapsed" data-bs-toggle="collapse" data-bs-target="#understanding-collapse">
                            <span>Check Understanding</span>
                            <svg class="chevron-icon" viewBox="0 0 16 16" fill="currentColor">
                                <path d="M8 0l8 8-8 8-1.4-1.4L13.2 8 6.6 1.4z"/>
                            </svg>
                        </a>
                        <div class="collapse sub-menu" id="understanding-collapse">
                            <a class="nav-link">Quiz</a>
                            <a class="nav-link">Practice Exercise</a>
                            <a class="nav-link">Review Material</a>
                        </div>

                        <!-- Summary -->
                        <a class="nav-link d-flex align-items-center justify-content-between collapsed" data-bs-toggle="collapse" data-bs-target="#summary-collapse">
                            <span>Summary</span>
                            <svg class="chevron-icon" viewBox="0 0 16 16" fill="currentColor">
                                <path d="M8 0l8 8-8 8-1.4-1.4L13.2 8 6.6 1.4z"/>
                            </svg>
                        </a>
                        <div class="collapse sub-menu" id="summary-collapse">
                            <a class="nav-link">Key Points</a>
                            <a class="nav-link">Resources</a>
                            <a class="nav-link">Next Steps</a>
                        </div>
                    </div>
                </nav>
            <div class="progress-badge p-2">
                       Last Updated: 3/2/2024
                    </div>
			</div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 p-4 shadow">
                <div class="text-secondary small mb-3">Lesson 5 of 8</div>

                <h1 class="display-6 fw-bold mb-4">Viewing and Submitting Absence/Attendance Requests via the ADP Mobile Solutions App</h1>

                <div class="mb-4">
                    <img src="/api/placeholder/1200/600" alt="Person using mobile phone" class="img-fluid rounded shadow-sm"/>
                </div>

                <h2 class="text-danger fw-bold h4 mb-3">Viewing and Submitting Absence/Attendance Requests</h2>

                <p class="text-secondary">
                    In the previous lesson, you learned how to view and submit your absence/attendance requests via the ADP Global myView Web Portal.
                </p>
            </div>
        </div>
    </div>
</body>
</html>
