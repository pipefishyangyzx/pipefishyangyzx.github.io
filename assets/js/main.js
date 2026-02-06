// 汉堡菜单功能
document.addEventListener('DOMContentLoaded', function() {
    const hamburger = document.querySelector('.hamburger');
    const navMenu = document.querySelector('.nav-menu');

    if (hamburger) {
        hamburger.addEventListener('click', function() {
            navMenu.classList.toggle('active');
            hamburger.classList.toggle('active');
        });
    }

    // 关闭菜单当点击导航链接时
    const navLinks = document.querySelectorAll('.nav-menu a');
    navLinks.forEach(link => {
        link.addEventListener('click', function() {
            navMenu.classList.remove('active');
            if (hamburger) {
                hamburger.classList.remove('active');
            }
        });
    });

    // 处理联系表单
    const contactForm = document.getElementById('contactForm');
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            handleContactForm();
        });
    }
});

// 处理联系表单提交
function handleContactForm() {
    const form = document.getElementById('contactForm');
    const messageDiv = document.getElementById('formMessage');
    
    // 获取表单数据
    const formData = new FormData(form);
    const data = {
        name: formData.get('name'),
        email: formData.get('email'),
        company: formData.get('company'),
        phone: formData.get('phone'),
        subject: formData.get('subject'),
        message: formData.get('message')
    };

    // 验证必填字段
    if (!data.name || !data.email || !data.subject || !data.message) {
        showMessage('请填写所有必填项', 'error', messageDiv);
        return;
    }

    // 验证邮箱格式
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(data.email)) {
        showMessage('请输入有效的邮箱地址', 'error', messageDiv);
        return;
    }

    // 模拟表单提交
    // 在实际应用中，这里应该发送数据到服务器
    console.log('表单数据：', data);
    
    showMessage('感谢您的提交！我们会尽快回复您。', 'success', messageDiv);
    form.reset();

    // 3秒后隐藏消息
    setTimeout(() => {
        messageDiv.style.display = 'none';
    }, 3000);
}

// 显示消息
function showMessage(message, type, element) {
    const messageDiv = element || document.getElementById('formMessage');
    if (messageDiv) {
        messageDiv.textContent = message;
        messageDiv.className = type;
        messageDiv.style.display = 'block';
    }
}

// 平滑滚动
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        const href = this.getAttribute('href');
        if (href !== '#' && href !== '#!') {
            e.preventDefault();
            const target = document.querySelector(href);
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        }
    });
});

// 检测滚动位置，为navbar添加阴影
window.addEventListener('scroll', function() {
    const navbar = document.querySelector('.navbar');
    if (window.scrollY > 0) {
        navbar.style.boxShadow = '0 4px 12px rgba(0, 0, 0, 0.15)';
    } else {
        navbar.style.boxShadow = '0 2px 10px rgba(0, 0, 0, 0.1)';
    }
});

// 为导航链接添加活动状态
function updateActiveNav() {
    const currentPage = window.location.pathname.split('/').pop() || 'index.html';
    const navLinks = document.querySelectorAll('.nav-menu a');
    
    navLinks.forEach(link => {
        const href = link.getAttribute('href');
        if (href === currentPage) {
            link.classList.add('active');
        } else {
            link.classList.remove('active');
        }
    });
}

// 页面加载时更新导航
document.addEventListener('DOMContentLoaded', updateActiveNav);

// 计数器动画
function animateCounter(element, target, duration = 2000) {
    let current = 0;
    const increment = target / (duration / 16);
    const timer = setInterval(() => {
        current += increment;
        if (current >= target) {
            element.textContent = target;
            clearInterval(timer);
        } else {
            element.textContent = Math.floor(current);
        }
    }, 16);
}

// 观察者API用于元素进入视口时触发动画
const observerOptions = {
    threshold: 0.5
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting && !entry.target.classList.contains('animated')) {
            entry.target.classList.add('animated');
            
            // 如果是统计数字，进行动画
            if (entry.target.classList.contains('stat-item')) {
                const statH3 = entry.target.querySelector('h3');
                if (statH3) {
                    const text = statH3.textContent;
                    const number = parseInt(text);
                    if (!isNaN(number)) {
                        animateCounter(statH3, number);
                    }
                }
            }
        }
    });
}, observerOptions);

// 观察统计项
document.querySelectorAll('.stat-item').forEach(element => {
    observer.observe(element);
});

// 滚动到顶部按钮
function createScrollToTopButton() {
    const button = document.createElement('button');
    button.innerHTML = '↑';
    button.classList.add('scroll-to-top');
    button.style.cssText = `
        position: fixed;
        bottom: 20px;
        right: 20px;
        background-color: #3498db;
        color: white;
        border: none;
        border-radius: 50%;
        width: 50px;
        height: 50px;
        font-size: 24px;
        cursor: pointer;
        display: none;
        z-index: 999;
        transition: all 0.3s ease;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    `;

    document.body.appendChild(button);

    window.addEventListener('scroll', () => {
        if (window.scrollY > 300) {
            button.style.display = 'block';
        } else {
            button.style.display = 'none';
        }
    });

    button.addEventListener('click', () => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });

    button.addEventListener('mouseover', () => {
        button.style.backgroundColor = '#2980b9';
        button.style.transform = 'scale(1.1)';
    });

    button.addEventListener('mouseout', () => {
        button.style.backgroundColor = '#3498db';
        button.style.transform = 'scale(1)';
    });
}

// AI 数据中心计数动画
function animateCounters() {
    const statCards = document.querySelectorAll('.ai-stat-card .stat-number');
    let hasStarted = false;

    const startAnimation = () => {
        if (hasStarted) return;
        hasStarted = true;

        statCards.forEach(card => {
            const target = parseInt(card.getAttribute('data-target'));
            const element = card;
            let current = 0;
            const increment = target / 50;
            const interval = setInterval(() => {
                if (current < target) {
                    current += increment;
                    element.textContent = Math.floor(current);
                } else {
                    element.textContent = target;
                    clearInterval(interval);
                }
            }, 30);
        });
    };

    // 当用户滚动到 AI 数据中心时触发动画
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                startAnimation();
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.5 });

    const aiSection = document.querySelector('.ai-datacenter');
    if (aiSection) {
        observer.observe(aiSection);
    }
}

// 地图地址数据交互
function setupMapInteractions() {
    const officeCards = document.querySelectorAll('.office-card');
    
    officeCards.forEach((card, index) => {
        card.style.animationDelay = `${index * 0.1}s`;
        card.classList.add('fade-in-up');

        card.addEventListener('click', function() {
            // 移除其他卡片的 active 类
            officeCards.forEach(c => c.classList.remove('active'));
            // 添加当前卡片的 active 类
            this.classList.add('active');
        });
    });
}

// 页面加载完成后创建滚动按钮
document.addEventListener('DOMContentLoaded', createScrollToTopButton);

// 初始化计数器动画
document.addEventListener('DOMContentLoaded', animateCounters);

// 初始化地图交互
document.addEventListener('DOMContentLoaded', setupMapInteractions);

// 日志
console.log('丰图科技官方网站已加载');
console.log('AI数据中心已启动 🤖');

// 地图搜索 - 简单模拟交互（占位实现）
document.addEventListener('DOMContentLoaded', function() {
    const searchBtn = document.getElementById('mapSearchBtn');
    const searchInput = document.getElementById('mapSearchInput');
    const mapCanvas = document.getElementById('mapCanvas');

    if (!mapCanvas) return;

    function clearMarkers() {
        const markers = mapCanvas.querySelectorAll('.map-marker');
        markers.forEach(m => m.remove());
    }

    function showToast(text, timeout = 2500) {
        let t = mapCanvas.querySelector('.map-toast');
        if (!t) {
            t = document.createElement('div');
            t.className = 'map-toast';
            mapCanvas.appendChild(t);
        }
        t.textContent = text;
        t.style.opacity = '1';
        setTimeout(() => { t.style.opacity = '0'; }, timeout);
    }

    function placeMarker(xPct, yPct) {
        const marker = document.createElement('div');
        marker.className = 'map-marker';
        marker.style.left = xPct + '%';
        marker.style.top = yPct + '%';
        mapCanvas.appendChild(marker);
        setTimeout(() => marker.classList.add('pop'), 20);
    }

    if (searchBtn && searchInput) {
        searchBtn.addEventListener('click', () => {
            const q = searchInput.value.trim();
            if (!q) {
                showToast('请输入搜索关键词');
                return;
            }
            clearMarkers();
            // 简单随机模拟若干标注位置
            const results = [ [30,40], [55,25], [70,60] ];
            results.forEach((pos, i) => {
                setTimeout(() => placeMarker(pos[0], pos[1]), i * 200);
            });
            showToast('找到 ' + results.length + ' 条结果：' + q);
        });
    }
});
