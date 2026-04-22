extends Node

# Questions database
var questions_db: Dictionary = {
    "代數": [
        {"question": "解方程: 2x + 5 = 13", "options": {"A": "x = 4", "B": "x = 5", "C": "x = 6", "D": "x = 3"}, "answer": "A"},
        {"question": "化簡: 3(x + 2) - 2x", "options": {"A": "x + 6", "B": "5x + 6", "C": "x + 2", "D": "3x + 2"}, "answer": "A"},
    ],
    "幾何": [
        {"question": "三角形內角和是多少度?", "options": {"A": "90°", "B": "180°", "C": "270°", "D": "360°"}, "answer": "B"},
        {"question": "正方形的四個角都是多少度?", "options": {"A": "60°", "B": "90°", "C": "120°", "D": "45°"}, "answer": "B"},
    ],
    "統計": [
        {"question": "平均數、中位數、眾數都是什麼?", "options": {"A": "數據", "B": "集中趨勢", "C": "分散程度", "D": "頻率"}, "answer": "B"},
    ],
    "概率": [
        {"question": "擲硬幣一次，出現正面的概率是多少?", "options": {"A": "1/3", "B": "1/2", "C": "1/4", "D": "2/3"}, "answer": "B"},
    ],
    "函數": [
        {"question": "y = 2x + 1 是一次函數嗎?", "options": {"A": "是", "B": "否", "C": "取決於x", "D": "無法判斷"}, "answer": "A"},
    ],
    "方程": [
        {"question": "x² = 16，求x?", "options": {"A": "x = 4", "B": "x = ±4", "C": "x = 8", "D": "x = 2"}, "answer": "B"},
    ],
    "面積": [
        {"question": "長方形面積 = 長 × 闊，邊長5和3的面積?", "options": {"A": "8", "B": "15", "C": "12", "D": "10"}, "answer": "B"},
    ],
    "坐標": [
        {"question": "原點的座標是?", "options": {"A": "(0,1)", "B": "(1,0)", "C": "(0,0)", "D": "(1,1)"}, "answer": "C"},
    ],
    "比率": [
        {"question": "1:2 = ?:6", "options": {"A": "2", "B": "3", "C": "4", "D": "5"}, "answer": "B"},
    ],
    "數列": [
        {"question": "2, 4, 6, 8... 第5項是?", "options": {"A": "9", "B": "10", "C": "11", "D": "12"}, "answer": "B"},
    ],
    "百分率": [
        {"question": "50的20%是多少?", "options": {"A": "5", "B": "10", "C": "15", "D": "20"}, "answer": "B"},
    ],
    "近似值": [
        {"question": "π約等於?", "options": {"A": "2.14", "B": "3.14", "C": "4.14", "D": "5.14"}, "answer": "B"},
    ],
}

func get_random_question(topic: String, difficulty: int) -> Dictionary:
    if questions_db.has(topic):
        var questions = questions_db[topic]
        if questions.size() > 0:
            return questions[randi() % questions.size()]
    return {}
