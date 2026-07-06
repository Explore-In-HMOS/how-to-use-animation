import { curves } from '@kit.ArkUI'

@Component
struct PageIntro {
  build() {
    Column({ space: 7 }) {
      Text('Animation Codelab')
        .fontSize(16).fontWeight(FontWeight.Bold).fontColor(Color.White)
      Text('← swipe to explore →')
        .fontSize(10).fontColor('#94A3B8').margin({ bottom: 4 })
      Text('1  Property — .animation()').fontSize(11).fontColor('#CBD5E1')
      Text('2  Explicit — animateTo()').fontSize(11).fontColor('#CBD5E1')
      Text('3  Rotate & Scale').fontSize(11).fontColor('#CBD5E1')
      Text('4  Transition Effect').fontSize(11).fontColor('#CBD5E1')
      Text('5  Spring Curve').fontSize(11).fontColor('#CBD5E1')
      Text('6  Keyframe').fontSize(11).fontColor('#CBD5E1')
      Text('7  Geometry Transition').fontSize(11).fontColor('#CBD5E1')
    }
    .width('100%').height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor('#0F172A')
  }
}

@Component
struct Page1PropertyAnimation {
  @State boxSize: number = 72
  @State boxColor: string = '#6366F1'
  @State boxRadius: number = 8
  @State isExpanded: boolean = false

  build() {
    Column() {
      Column({ space: 4 }) {
        Text('1 / 7  ·  Property Animation')
          .fontSize(10).fontColor('#94A3B8')
        Text('.animation() modifier')
          .fontSize(13).fontWeight(FontWeight.Bold).fontColor(Color.White)
      }
      .width('100%').height(70)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column() {
        Column()
          .width(this.boxSize).height(this.boxSize)
          .backgroundColor(this.boxColor)
          .borderRadius(this.boxRadius)
          .animation({ duration: 600, curve: Curve.EaseInOut })
          .onClick(() => {
            this.isExpanded = !this.isExpanded
            this.boxSize   = this.isExpanded ? 110 : 72
            this.boxColor  = this.isExpanded ? '#EC4899' : '#6366F1'
            this.boxRadius = this.isExpanded ? 55 : 8
          })
      }
      .width('100%').layoutWeight(1)
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
      .padding({ top: 8 })
    }
    .width('100%').height('100%').backgroundColor('#0F172A')
  }
}

@Component
struct Page2ExplicitAnimation {
  @State offsetX: number = 0
  @State moved: boolean = false

  build() {
    Column() {
      Column({ space: 4 }) {
        Text('2 / 7  ·  Explicit Animation')
          .fontSize(10).fontColor('#94A3B8')
        Text('UIContext.animateTo()')
          .fontSize(13).fontWeight(FontWeight.Bold).fontColor(Color.White)
      }
      .width('100%').height(70)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column() {
        Stack({ alignContent: Alignment.Start }) {
          Row()
            .width(220).height(4)
            .backgroundColor('#334155').borderRadius(2)
            .margin({ top: 20 })
          Column()
            .width(44).height(44).borderRadius(22)
            .backgroundColor('#10B981')
            .shadow({ radius: 8, color: '#10B98160', offsetX: 0, offsetY: 4 })
            .translate({ x: this.offsetX })
        }
        .width(220).height(50)
      }
      .width('100%').layoutWeight(1)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column() {
        Button(this.moved ? 'Back' : 'Slide')
          .width(120).height(36).fontSize(13)
          .backgroundColor('#10B981').fontColor(Color.White).borderRadius(18)
          .onClick(() => {

            this.getUIContext().animateTo({ duration: 700, curve: Curve.EaseOut }, () => {
              this.moved = !this.moved
              this.offsetX = this.moved ? 176 : 0
            })
          })
      }
      .width('100%').height(70)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .padding({ bottom: 22 })
    }
    .width('100%').height('100%').backgroundColor('#0F172A')
  }
}

@Component
struct Page3RotateScale {
  @State rotateAngle: number = 0
  @State scaleVal: number = 1.0
  @State toggled: boolean = false

  build() {
    Column() {
      Column({ space: 4 }) {
        Text('3 / 7  ·  Rotate & Scale')
          .fontSize(10).fontColor('#94A3B8')
        Text('rotate() + scale()')
          .fontSize(13).fontWeight(FontWeight.Bold).fontColor(Color.White)
      }
      .width('100%').height(70)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column() {
        Text('★')
          .fontSize(58).fontColor('#F59E0B')
          .rotate({ x: 0, y: 0, z: 1, angle: this.rotateAngle })
          .scale({ x: this.scaleVal, y: this.scaleVal })
          .shadow({ radius: 14, color: '#F59E0B50', offsetX: 0, offsetY: 0 })
      }
      .width('100%').layoutWeight(1)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column() {
        Button(this.toggled ? 'Reset' : 'Spin')
          .width(120).height(36).fontSize(13)
          .backgroundColor('#F59E0B').fontColor(Color.White).borderRadius(18)
          .onClick(() => {
            this.getUIContext().animateTo({ duration: 700, curve: Curve.EaseInOut }, () => {
              this.toggled = !this.toggled
              this.rotateAngle = this.toggled ? 360 : 0
              this.scaleVal    = this.toggled ? 1.25 : 1.0
            })
          })
      }
      .width('100%').height(70)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .padding({ bottom: 22 })
    }
    .width('100%').height('100%').backgroundColor('#0F172A')
  }
}

@Component
struct Page4TransitionEffect {
  @State showCard: boolean = false

  build() {
    Column() {
      Column({ space: 4 }) {
        Text('4 / 7  ·  Transition Effect')
          .fontSize(10).fontColor('#94A3B8')
        Text('.asymmetric()')
          .fontSize(13).fontWeight(FontWeight.Bold).fontColor(Color.White)
      }
      .width('100%').height(70)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      Stack({ alignContent: Alignment.Center }) {
        if (this.showCard) {

          Column({ space: 8 }) {
            Text('🎉').fontSize(30)
            Text('Card expanded!')
              .fontSize(13).fontWeight(FontWeight.Bold).fontColor(Color.White)
            Text('Slide + Opacity')
              .fontSize(11).fontColor('#CBD5E1')
          }
          .width(160).height(160)
          .backgroundColor('#7C3AED').borderRadius(20)
          .justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center)
          .shadow({ radius: 18, color: '#7C3AED60', offsetX: 0, offsetY: 8 })

          .transition(
            TransitionEffect.asymmetric(
              TransitionEffect.translate({ y: 40 })
                .combine(TransitionEffect.opacity(0))
                .animation({ duration: 400, curve: Curve.EaseOut }),
              TransitionEffect.translate({ y: -24 })
                .combine(TransitionEffect.opacity(0))
                .animation({ duration: 280, curve: Curve.EaseIn })
            )
          )
        } else {

          Column() {
            Text('🎉').fontSize(22)
          }
          .width(160).height(90)
          .backgroundColor('#4C1D95').borderRadius(14)
          .justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center)
          .transition(
            TransitionEffect.asymmetric(
              TransitionEffect.translate({ y: -24 })
                .combine(TransitionEffect.opacity(0))
                .animation({ duration: 280, curve: Curve.EaseIn }),
              TransitionEffect.translate({ y: 40 })
                .combine(TransitionEffect.opacity(0))
                .animation({ duration: 400, curve: Curve.EaseOut })
            )
          )
        }
      }
      .width('100%').layoutWeight(1)
      .clip(true)

      Column() {
        Button(this.showCard ? 'Collapse' : 'Expand')
          .width(120).height(36).fontSize(13)
          .backgroundColor('#7C3AED').fontColor(Color.White).borderRadius(18)
          .onClick(() => {
            this.getUIContext().animateTo({ duration: 400 }, () => {
              this.showCard = !this.showCard
            })
          })
      }
      .width('100%').height(70)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .padding({ bottom: 22 })
    }
    .width('100%').height('100%').backgroundColor('#0F172A')
  }
}

@Component
struct Page5SpringCurve {
  @State posY: number = 0
  @State ballColor: string = '#F43F5E'
  @State bouncing: boolean = false

  build() {
    Column() {
      Column({ space: 4 }) {
        Text('5 / 7  ·  Spring Curve')
          .fontSize(10).fontColor('#94A3B8')
        Text('curves.springMotion()')
          .fontSize(13).fontWeight(FontWeight.Bold).fontColor(Color.White)
      }
      .width('100%').height(70)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column() {
        Column()
          .width(50).height(50).borderRadius(25)
          .backgroundColor(this.ballColor)
          .shadow({ radius: 10, color: '#F43F5E60', offsetX: 0, offsetY: 4 })
          .translate({ y: this.posY })

          .animation({ curve: curves.springMotion(0.35, 0.7), duration: 900 })
          .margin({ bottom: 6 })
        Row()
          .width(110).height(4)
          .backgroundColor('#475569').borderRadius(2)
      }
      .width('100%').layoutWeight(1)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column() {
        Button(this.bouncing ? 'Drop' : 'Toss')
          .width(120).height(36).fontSize(13)
          .backgroundColor('#F43F5E').fontColor(Color.White).borderRadius(18)
          .onClick(() => {
            this.bouncing = !this.bouncing
            this.posY = this.bouncing ? -76 : 0
            this.ballColor = this.bouncing ? '#F97316' : '#F43F5E'
          })
      }
      .width('100%').height(70)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .padding({ bottom: 22 })
    }
    .width('100%').height('100%').backgroundColor('#0F172A')
  }
}

@Component
struct Page6Keyframe {
  @State myScale: number = 1.0
  @State myColor: string = '#3B82F6'

  build() {
    Column() {
      Column({ space: 4 }) {
        Text('6 / 7  ·  Keyframe Animation')
          .fontSize(10).fontColor('#94A3B8')
        Text('keyframeAnimateTo()')
          .fontSize(13).fontWeight(FontWeight.Bold).fontColor(Color.White)
      }
      .width('100%').height(70)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column() {
        Column()
          .width(68).height(68).borderRadius(12)
          .backgroundColor(this.myColor)
          .scale({ x: this.myScale, y: this.myScale })
          .shadow({ radius: 12, color: '#3B82F660', offsetX: 0, offsetY: 4 })
      }
      .width('100%').layoutWeight(1)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column() {
        Button('Play')
          .width(120).height(36).fontSize(13)
          .backgroundColor('#3B82F6').fontColor(Color.White).borderRadius(18)
          .onClick(() => {
            this.myScale = 1.0
            this.myColor = '#3B82F6'

            this.getUIContext().keyframeAnimateTo({ iterations: 1 }, [
              { duration: 380, event: () => { this.myScale = 1.2;  this.myColor = '#F59E0B' } },
              { duration: 280, event: () => { this.myScale = 0.85; this.myColor = '#EC4899' } },
              { duration: 380, event: () => { this.myScale = 1.0;  this.myColor = '#3B82F6' } }
            ])
          })
      }
      .width('100%').height(70)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .padding({ bottom: 22 })
    }
    .width('100%').height('100%').backgroundColor('#0F172A')
  }
}

@Component
struct Page7GeometryTransition {
  @State isExpanded: boolean = false

  build() {
    Column() {
      Column({ space: 4 }) {
        Text('7 / 7  ·  Geometry Transition')
          .fontSize(10).fontColor('#94A3B8')
        Text('geometryTransition()')
          .fontSize(13).fontWeight(FontWeight.Bold).fontColor(Color.White)
      }
      .width('100%').height(70)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      Stack({ alignContent: Alignment.Center }) {
        if (!this.isExpanded) {

          Column() {
            Text('🔵').fontSize(26)
          }
          .width(90).height(90)
          .backgroundColor('#1E40AF').borderRadius(18)
          .justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center)

          .geometryTransition('geoCard')
          .transition(TransitionEffect.OPACITY)
        } else {

          Column({ space: 8 }) {
            Text('🔵').fontSize(44)
          }
          .width(160).height(160)
          .backgroundColor('#2563EB').borderRadius(24)
          .justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center)
          .shadow({ radius: 20, color: '#2563EB60', offsetX: 0, offsetY: 8 })
          .geometryTransition('geoCard')
          .transition(TransitionEffect.OPACITY)
        }
      }
      .width('100%').layoutWeight(1)
      .clip(true)
      .onClick(() => {
        this.getUIContext().animateTo(
          { duration: 480, curve: curves.springMotion(0.4, 0.8) },
          () => { this.isExpanded = !this.isExpanded }
        )
      })
      Column() {
        Text('tap the card')
          .fontSize(10).fontColor('#475569')
      }
      .width('100%').height(70)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%').height('100%').backgroundColor('#0F172A')
  }
}

@Entry
@Component
struct AnimationCodelab {
  build() {
    Swiper() {
      PageIntro()
      Page1PropertyAnimation()
      Page2ExplicitAnimation()
      Page3RotateScale()
      Page4TransitionEffect()
      Page5SpringCurve()
      Page6Keyframe()
      Page7GeometryTransition()
    }
    .width('100%').height('100%')
    .loop(false)
    .duration(300)
    .curve(Curve.EaseInOut)
    .indicator(
      new DotIndicator()
        .color('#1E293B')
        .selectedColor('#A78BFA')
        .itemWidth(5).itemHeight(5)
        .selectedItemWidth(12).selectedItemHeight(5)
    )
    .backgroundColor('#0F172A')
  }
}
