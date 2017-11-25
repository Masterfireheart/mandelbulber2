/*
 * frame_slider_popup.h
 *
 *  Created on: 25 lis 2017
 *      Author: krzysztof
 */

#ifndef MANDELBULBER2_QT_FRAME_SLIDER_POPUP_H_
#define MANDELBULBER2_QT_FRAME_SLIDER_POPUP_H_

#include <QFrame>

namespace Ui
{
class cFrameSiderPopup;
}

class cFrameSiderPopup : public QFrame
{
	Q_OBJECT
public:
	explicit cFrameSiderPopup(QWidget *parent = nullptr);
	~cFrameSiderPopup();

private:
	Ui::cFrameSiderPopup *ui;
	QTimer *sliderTimer;

public:
	int value() const;

private slots:
	void sliderReleased();
	void slotSliderTimerTrigger();

signals:
	void resetPressed();
	void zeroPressed();
	void halfPressed();
	void doublePressed();
	void intPressed();
	void timerTrigger();
};

#endif /* MANDELBULBER2_QT_FRAME_SLIDER_POPUP_H_ */
