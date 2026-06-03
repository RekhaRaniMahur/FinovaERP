<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="FinovaERP.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="hero-section">
        <div class="hero-overlay"></div>
        <div class="container">
            <div class="row align-items-center min-vh-100">
                <div class="col-lg-6 hero-content animate-slide-up">
                    <div class="hero-badge-wrapper">
                        <span class="hero-badge">
                            <i class="fas fa-chart-line me-2"></i> Trusted by 10,000+ Investors
                        </span>
                    </div>
                    <h1 class="hero-title">
                        Grow Your Wealth<br />
                        With <span class="gradient-text">Smart Financial</span> Planning
                    </h1>
                    <p class="hero-subtitle">
                        AI-powered investment tracking, SIP planning, retirement goals, 
                        and wealth management all in one intelligent platform.
                    </p>
                    <div class="hero-buttons">
                        <a href="/Dashboard.aspx" class="btn btn-primary-glow">
                            Start Free Journey <i class="fas fa-arrow-right ms-2"></i>
                        </a>
                        <a href="#products" class="btn btn-outline-premium">
                            <i class="fas fa-play-circle me-2"></i> Watch Demo
                        </a>
                    </div>
                    <div class="hero-stats mt-5">
                        <div class="row">
                            <div class="col-4">
                                <div class="stat-badge">
                                    <span class="stat-number">₹500Cr+</span>
                                    <span class="stat-label">Assets Managed</span>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="stat-badge">
                                    <span class="stat-number">99.9%</span>
                                    <span class="stat-label">Satisfaction</span>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="stat-badge">
                                    <span class="stat-number">24/7</span>
                                    <span class="stat-label">Support</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 text-center animate-slide-up-delay">
                    <div class="dashboard-preview-wrapper">
                        <div class="floating-card card-1">
                            <i class="fas fa-chart-line"></i>
                            <span>+28.5%</span>
                        </div>
                        <div class="floating-card card-2">
                            <i class="fas fa-wallet"></i>
                            <span>₹12.4L</span>
                        </div>
                        <div class="floating-card card-3">
                            <i class="fas fa-trophy"></i>
                            <span>Top Rated</span>
                        </div>
                        
                        <!-- Professional Animated Graph Chart -->
                        <div class="professional-chart">
                            <div class="chart-header">
                                <div class="chart-title">
                                    <i class="fas fa-chart-line"></i>
                                    <span>Portfolio Performance 2024</span>
                                </div>
                                <div class="chart-legend">
                                    <span><i class="fas fa-circle" style="color: #2563eb;"></i> Equity</span>
                                    <span><i class="fas fa-circle" style="color: #06b6d4;"></i> Debt</span>
                                    <span><i class="fas fa-circle" style="color: #10b981;"></i> Returns</span>
                                </div>
                            </div>
                            <div class="chart-container">
                                <canvas id="portfolioChart" width="500" height="300"></canvas>
                            </div>
                            <div class="chart-stats">
                                <div class="chart-stat-item">
                                    <span class="stat-value">₹24.8L</span>
                                    <span class="stat-label">Total Invested</span>
                                </div>
                                <div class="chart-stat-item">
                                    <span class="stat-value">₹32.6L</span>
                                    <span class="stat-label">Current Value</span>
                                </div>
                                <div class="chart-stat-item">
                                    <span class="stat-value text-success">+31.4%</span>
                                    <span class="stat-label">Total Returns</span>
                                </div>
                            </div>
                        </div>
                        <div class="dashboard-glow"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="hero-wave">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 120">
                <path fill="#ffffff" fill-opacity="1" d="M0,64L80,69.3C160,75,320,85,480,80C640,75,800,53,960,48C1120,43,1280,53,1360,58.7L1440,64L1440,120L1360,120C1280,120,1120,120,960,120C800,120,640,120,480,120C320,120,160,120,80,120L0,120Z"></path>
            </svg>
        </div>
    </section>

    <!-- ============================================ -->
    <!-- 2️⃣ TRUST BAR - Animated Counter             -->
    <!-- ============================================ -->
    <section class="trust-bar-section">
        <div class="container">
            <div class="trust-wrapper">
                <div class="trust-item animate-on-scroll">
                    <div class="trust-icon"><i class="fas fa-users"></i></div>
                    <div class="trust-content">
                        <h3 class="counter" data-target="10000">0</h3>
                        <p>Active Investors</p>
                    </div>
                </div>
                <div class="trust-item animate-on-scroll">
                    <div class="trust-icon"><i class="fas fa-chart-pie"></i></div>
                    <div class="trust-content">
                        <h3 class="counter" data-target="500">0</h3>
                        <p>Investment Plans</p>
                    </div>
                </div>
                <div class="trust-item animate-on-scroll">
                    <div class="trust-icon"><i class="fas fa-tools"></i></div>
                    <div class="trust-content">
                        <h3 class="counter" data-target="50">0</h3>
                        <p>Financial Tools</p>
                    </div>
                </div>
                <div class="trust-item animate-on-scroll">
                    <div class="trust-icon"><i class="fas fa-star"></i></div>
                    <div class="trust-content">
                        <h3 class="counter" data-target="99">0</h3>
                        <p>Customer Satisfaction</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ============================================ -->
    <!-- 3️⃣ SERVICES SECTION - Premium Cards         -->
    <!-- ============================================ -->
    <section class="services-premium" id="services">
        <div class="container">
            <div class="section-header text-center animate-on-scroll">
                <span class="section-badge">Our Services</span>
                <h2 class="section-title">Smart Financial <span class="gradient-text">Solutions</span></h2>
                <p class="section-subtitle">AI-powered tools designed for your financial success</p>
            </div>
            <div class="row g-4">
                <div class="col-md-3">
                    <div class="service-card-premium animate-on-scroll" data-delay="0">
                        <div class="card-glow"></div>
                        <div class="service-icon-wrapper">
                            <div class="service-icon-inner">
                                <i class="fas fa-chart-line"></i>
                            </div>
                        </div>
                        <h4>SIP Planner</h4>
                        <p>Intelligent SIP calculator with goal-based investing strategies</p>
                        <a href="#" class="card-link">Learn More <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="service-card-premium animate-on-scroll" data-delay="1">
                        <div class="card-glow"></div>
                        <div class="service-icon-wrapper">
                            <div class="service-icon-inner">
                                <i class="fas fa-calculator"></i>
                            </div>
                        </div>
                        <h4>EMI Calculator</h4>
                        <p>Quick EMI calculations with amortization schedules</p>
                        <a href="#" class="card-link">Learn More <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="service-card-premium animate-on-scroll" data-delay="2">
                        <div class="card-glow"></div>
                        <div class="service-icon-wrapper">
                            <div class="service-icon-inner">
                                <i class="fas fa-umbrella"></i>
                            </div>
                        </div>
                        <h4>Retirement Planning</h4>
                        <p>Secure your golden years with smart retirement tools</p>
                        <a href="#" class="card-link">Learn More <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="service-card-premium animate-on-scroll" data-delay="3">
                        <div class="card-glow"></div>
                        <div class="service-icon-wrapper">
                            <div class="service-icon-inner">
                                <i class="fas fa-file-invoice-dollar"></i>
                            </div>
                        </div>
                        <h4>Tax Saving</h4>
                        <p>Maximize returns with smart tax-saving strategies</p>
                        <a href="#" class="card-link">Learn More <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ============================================ -->
    <!-- 4️⃣ ABOUT SECTION - Premium Layout           -->
    <!-- ============================================ -->
    <section class="about-premium" id="about">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 animate-on-scroll">
                    <div class="about-image-wrapper">
                        <img src="https://img.freepik.com/free-vector/financial-growth-concept-illustration_114360-1080.jpg?w=500"
                            alt="About FinovaERP" class="about-premium-img"
                            onerror="this.src='https://placehold.co/550x500/1e3a8a/ffffff?text=FINANCIAL+GROWTH&font=montserrat'" />
                        <div class="experience-badge">
                            <span class="exp-number">5+</span>
                            <span class="exp-text">Years of Excellence</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 animate-on-scroll">
                    <span class="section-badge">About Us</span>
                    <h2 class="section-title">Why <span class="gradient-text">FinovaERP</span> is Your Trusted Partner</h2>
                    <p class="about-premium-text">
                        We're revolutionizing financial planning with cutting-edge technology, 
                        making wealth management accessible, transparent, and intelligent for everyone.
                    </p>
                    <div class="feature-grid">
                        <div class="feature-item-premium">
                            <div class="feature-icon-premium">
                                <i class="fas fa-shield-alt"></i>
                            </div>
                            <div>
                                <h5>Bank-Grade Security</h5>
                                <p>256-bit encryption for complete safety</p>
                            </div>
                        </div>
                        <div class="feature-item-premium">
                            <div class="feature-icon-premium">
                                <i class="fas fa-robot"></i>
                            </div>
                            <div>
                                <h5>AI Recommendations</h5>
                                <p>Personalized investment insights</p>
                            </div>
                        </div>
                        <div class="feature-item-premium">
                            <div class="feature-icon-premium">
                                <i class="fas fa-chart-line"></i>
                            </div>
                            <div>
                                <h5>Real-time Analytics</h5>
                                <p>Live portfolio tracking & insights</p>
                            </div>
                        </div>
                        <div class="feature-item-premium">
                            <div class="feature-icon-premium">
                                <i class="fas fa-headset"></i>
                            </div>
                            <div>
                                <h5>24/7 Expert Support</h5>
                                <p>Dedicated financial advisors</p>
                            </div>
                        </div>
                    </div>
                    <a href="/About.aspx" class="btn-primary-glow mt-4">Discover More <i class="fas fa-long-arrow-alt-right ms-2"></i></a>
                </div>
            </div>
        </div>
    </section>

    <!-- ============================================ -->
    <!-- 5️⃣ STATISTICS SECTION - Premium Cards       -->
    <!-- ============================================ -->
    <section class="stats-premium">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-3">
                    <div class="stats-premium-card animate-on-scroll">
                        <div class="stats-premium-icon">
                            <i class="fas fa-chart-simple"></i>
                        </div>
                        <h2 class="stats-counter" data-target="10000">0</h2>
                        <p>Active Investors</p>
                        <span class="stats-trend"><i class="fas fa-arrow-up"></i> +23% this year</span>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-premium-card animate-on-scroll">
                        <div class="stats-premium-icon">
                            <i class="fas fa-rupee-sign"></i>
                        </div>
                        <h2 class="stats-counter" data-target="500">0</h2>
                        <p>Investment Plans</p>
                        <span class="stats-trend"><i class="fas fa-arrow-up"></i> +15% this year</span>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-premium-card animate-on-scroll">
                        <div class="stats-premium-icon">
                            <i class="fas fa-trophy"></i>
                        </div>
                        <h2 class="stats-counter" data-target="50">0</h2>
                        <p>Financial Tools</p>
                        <span class="stats-trend"><i class="fas fa-arrow-up"></i> +8 new tools</span>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-premium-card animate-on-scroll">
                        <div class="stats-premium-icon">
                            <i class="fas fa-smile"></i>
                        </div>
                        <h2 class="stats-counter" data-target="99">0</h2>
                        <p>Satisfaction Rate</p>
                        <span class="stats-trend"><i class="fas fa-star"></i> 4.9/5 rating</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ============================================ -->
    <!-- 6️⃣ FINANCIAL PRODUCTS SECTION               -->
    <!-- ============================================ -->
    <section class="products-premium" id="products">
        <div class="container">
            <div class="section-header text-center animate-on-scroll">
                <span class="section-badge">Our Products</span>
                <h2 class="section-title">Explore Our <span class="gradient-text">Financial Products</span></h2>
                <p class="section-subtitle">Tailored solutions for every life stage</p>
            </div>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="product-card-premium animate-on-scroll">
                        <div class="product-image">
                            <i class="fas fa-chart-line"></i>
                        </div>
                        <h4>Mutual Funds</h4>
                        <p>Diversified portfolios with expert management</p>
                        <div class="product-features">
                            <span>🔹 Direct Plans</span>
                            <span>🔹 Zero Commission</span>
                        </div>
                        <a href="#" class="product-link">Explore Funds →</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="product-card-premium animate-on-scroll" data-delay="1">
                        <div class="product-image">
                            <i class="fas fa-shield-alt"></i>
                        </div>
                        <h4>Insurance Plans</h4>
                        <p>Comprehensive coverage for you and your family</p>
                        <div class="product-features">
                            <span>🔹 Term Insurance</span>
                            <span>🔹 Health Plans</span>
                        </div>
                        <a href="#" class="product-link">Get Protected →</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="product-card-premium animate-on-scroll" data-delay="2">
                        <div class="product-image">
                            <i class="fas fa-building"></i>
                        </div>
                        <h4>Retirement Solutions</h4>
                        <p>Plan your dream retirement with confidence</p>
                        <div class="product-features">
                            <span>🔹 NPS Plans</span>
                            <span>🔹 Annuity Options</span>
                        </div>
                        <a href="#" class="product-link">Plan Retirement →</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ============================================ -->
    <!-- 7️⃣ TESTIMONIALS SECTION - Premium           -->
    <!-- ============================================ -->
    <section class="testimonials-premium">
        <div class="container">
            <div class="section-header text-center animate-on-scroll">
                <span class="section-badge">Testimonials</span>
                <h2 class="section-title text-white">What Our <span class="gradient-text">Clients Say</span></h2>
                <p class="section-subtitle text-white-50">Trusted by thousands of happy investors</p>
            </div>
            <div class="testimonial-slider">
                <div class="row">
                    <div class="col-md-6">
                        <div class="testimonial-card-premium animate-on-scroll">
                            <div class="quote-icon"><i class="fas fa-quote-left"></i></div>
                            <div class="stars">★★★★★</div>
                            <p class="testimonial-text">
                                "FinovaERP transformed my financial journey. The dashboard gives me complete visibility of my investments and retirement goals."
                            </p>
                            <div class="testimonial-author">
                                <div class="author-avatar">
                                    <i class="fas fa-user-circle"></i>
                                </div>
                                <div>
                                    <h5>Rahul Sharma</h5>
                                    <p>Senior Analyst, Mumbai</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="testimonial-card-premium animate-on-scroll" data-delay="1">
                            <div class="quote-icon"><i class="fas fa-quote-left"></i></div>
                            <div class="stars">★★★★★</div>
                            <p class="testimonial-text">
                                "Best investment platform I've used. The SIP planner helped me achieve my financial goals faster than expected."
                            </p>
                            <div class="testimonial-author">
                                <div class="author-avatar">
                                    <i class="fas fa-user-circle"></i>
                                </div>
                                <div>
                                    <h5>Priya Mehta</h5>
                                    <p>Entrepreneur, Delhi</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ============================================ -->
    <!-- 8️⃣ CALL TO ACTION SECTION                   -->
    <!-- ============================================ -->
    <section class="cta-premium">
        <div class="container">
            <div class="cta-wrapper animate-on-scroll">
                <div class="cta-content">
                    <h2>Ready to Transform Your Financial Future?</h2>
                    <p>Join 10,000+ smart investors already growing their wealth with FinovaERP</p>
                    <div class="cta-buttons">
                        <a href="/Register.aspx" class="btn-primary-glow btn-large">
                            Start Free Trial <i class="fas fa-arrow-right ms-2"></i>
                        </a>
                        <a href="/Contact.aspx" class="btn-outline-premium btn-large">
                            Schedule Demo <i class="fas fa-calendar-alt ms-2"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ============================================ -->
    <!-- CHART.JS LIBRARY & GRAPH SCRIPT              -->
    <!-- ============================================ -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
    
    <script>
        // Professional Portfolio Chart
        document.addEventListener('DOMContentLoaded', function () {
            const ctx = document.getElementById('portfolioChart').getContext('2d');

            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    datasets: [
                        {
                            label: 'Equity Growth',
                            data: [12, 15, 18, 22, 28, 32, 38, 42, 48, 52, 58, 65],
                            borderColor: '#2563eb',
                            backgroundColor: 'rgba(37, 99, 235, 0.05)',
                            borderWidth: 3,
                            fill: true,
                            tension: 0.4,
                            pointRadius: 4,
                            pointBackgroundColor: '#2563eb',
                            pointBorderColor: '#ffffff',
                            pointBorderWidth: 2,
                        },
                        {
                            label: 'Debt Returns',
                            data: [8, 9, 11, 12, 14, 16, 18, 19, 21, 22, 24, 26],
                            borderColor: '#06b6d4',
                            backgroundColor: 'rgba(6, 182, 212, 0.05)',
                            borderWidth: 3,
                            fill: true,
                            tension: 0.4,
                            pointRadius: 4,
                            pointBackgroundColor: '#06b6d4',
                            pointBorderColor: '#ffffff',
                            pointBorderWidth: 2,
                        },
                        {
                            label: 'Total Portfolio',
                            data: [20, 24, 29, 34, 42, 48, 56, 61, 69, 74, 82, 91],
                            borderColor: '#10b981',
                            backgroundColor: 'rgba(16, 185, 129, 0.02)',
                            borderWidth: 3,
                            borderDash: [5, 5],
                            tension: 0.4,
                            pointRadius: 0,
                            fill: false,
                        }
                    ]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: true,
                    plugins: {
                        legend: {
                            display: false,
                        },
                        tooltip: {
                            backgroundColor: '#1e293b',
                            titleColor: '#ffffff',
                            bodyColor: '#cbd5e1',
                            borderColor: '#2563eb',
                            borderWidth: 1,
                            callbacks: {
                                label: function (context) {
                                    return context.dataset.label + ': ₹' + context.raw + 'L';
                                }
                            }
                        }
                    },
                    scales: {
                        y: {
                            grid: {
                                color: 'rgba(255, 255, 255, 0.1)',
                                drawBorder: false,
                            },
                            ticks: {
                                color: 'rgba(255, 255, 255, 0.7)',
                                callback: function (value) {
                                    return '₹' + value + 'L';
                                }
                            },
                            title: {
                                display: true,
                                text: 'Portfolio Value (₹ Lakhs)',
                                color: 'rgba(255, 255, 255, 0.6)',
                                font: { size: 11 }
                            }
                        },
                        x: {
                            grid: {
                                display: false,
                            },
                            ticks: {
                                color: 'rgba(255, 255, 255, 0.7)',
                            }
                        }
                    },
                    interaction: {
                        intersect: false,
                        mode: 'index',
                    },
                    animation: {
                        duration: 2000,
                        easing: 'easeInOutQuart',
                    }
                }
            });
        });

        // Counter Animation
        const counters = document.querySelectorAll('.counter, .stats-counter');
        const speed = 200;

        const animateCounter = (counter) => {
            const target = parseInt(counter.getAttribute('data-target'));
            let count = 0;
            const increment = target / speed;

            const updateCount = () => {
                if (count < target) {
                    count += increment;
                    counter.innerText = Math.ceil(count);
                    setTimeout(updateCount, 20);
                } else {
                    counter.innerText = target + (target === 99 ? '%' : '+');
                }
            };
            updateCount();
        };

        // Scroll Animation Observer
        const animateOnScroll = () => {
            const elements = document.querySelectorAll('.animate-on-scroll');

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('animated');

                        const counter = entry.target.querySelector('.counter, .stats-counter');
                        if (counter && !counter.classList.contains('animated-counter')) {
                            counter.classList.add('animated-counter');
                            animateCounter(counter);
                        }
                        observer.unobserve(entry.target);
                    }
                });
            }, { threshold: 0.2 });

            elements.forEach(element => observer.observe(element));
        };

        // Smooth scroll for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({ behavior: 'smooth' });
                }
            });
        });

        // Initialize on load
        document.addEventListener('DOMContentLoaded', () => {
            animateOnScroll();

            setTimeout(() => {
                document.querySelectorAll('.counter, .stats-counter').forEach(counter => {
                    if (counter.getBoundingClientRect().top < window.innerHeight) {
                        animateCounter(counter);
                    }
                });
            }, 500);
        });
    </script>

</asp:Content>
